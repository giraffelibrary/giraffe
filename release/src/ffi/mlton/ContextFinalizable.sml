(* Copyright (C) 2015, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(* The structure ContextFinalizable is derived from MLtonFinalizable.
 *
 * https://github.com/MLton/mlton/blob/master/basis-library/mlton/finalizable.sml
 *
 * Copyright (C) 2003-2006 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 *
 * MLton is released under a BSD-style license.
 * See the file MLton-LICENSE for details.
 *)

structure ContextFinalizable :> CONTEXT_FINALIZABLE =
  struct
    datatype 'a t =
      T of {
        value : 'a ref,
        finalizers : ('a -> unit) list ref,
        afters : (unit -> unit) list ref
      }

    (* `touch (T {value, ...})` is an operation that requires `value` but
     * does nothing. *)
    fun touch (T {value, ...}) = Primitive.MLton.Finalizable.touch value

    fun withValue (t as T {value, ...}, f) =
      (f (! value) before touch t) handle e => (touch t; raise e)

    fun addFinalizer (T {finalizers, ...}, f) =
      finalizers := f :: ! finalizers

    fun finalizeBefore (T {afters, ...}, t) =
      afters := (fn () => touch t) :: ! afters


    (* The type for a set of finalizable values that have not been finalized
     * is a list of `pending` values, represented by the type `pending list`.
     * There is a pending list for context-less ('global') finalizable values
     * and a context table containing separate pending lists for finalizable
     * values in each context.
     *
     * To allow finalization of different contexts to run concurrently in a
     * multithreaded implementation, each pending list is stored in its own
     * shared variable with a thread-safe update.  This way, different
     * threads can hold a lock on different pending lists simultaneously.  If
     * we did not have a separate pending list for each context, it would be
     * necessary to hold a lock on the whole context table, preventing
     * concurrent updates to different contexts.
     *
     * During the lifetime of a context, the context has an associated
     * pending list shared variable and possibly a marshaler.  The external
     * representation of a context (given by the type `Context.t`) is a
     * reference to the internal key representation and a weak reference is
     * used to determine whether a context is no longer required.  Even after
     * a context key is no longer referenced outside this module, there can
     * still be pending finalizers for the context, so any marshaler set for
     * the context must still be retained.  The pending list shared variable
     * and marshaler for a finalized context is removed once the list is
     * empty, i.e. all pending values are finalized.  At this time, it must
     * not be possible for a pending value to be added to the pending list
     * shared variable.  This is theoretically possible if an ongoing
     * `newInContext` operation holds the last reference to a context that
     * becomes unreferenced once the pending list shared variable has been
     * looked up but not yet updated.  Therefore the `newInContext` operation
     * holds a reference on its context argument until after the pending list
     * shared variable is updated.
     *
     * Note that the context table implementation provides thread-safe
     * insertion and filtering operations.
     *)

    type pending =
      {
        isAlive : unit -> bool,
        runFinalizers : unit -> unit
      }
    type pending_list_sv = pending list SharedVar.t

    structure ContextTable = WordTable(Word)
    type context_key = ContextTable.key  (* = `word` *)
    type context_marshaler = (unit -> unit) -> unit
    type context_entry =
      {
        pendingList : pending_list_sv,
        isAlive     : (unit -> bool) ref,
        marshaler   : context_marshaler option ref
      }
    type context_entry_table = context_entry ContextTable.t

    (* State for finalizable values whose finalization is pending. *)
    val globalPendingList : pending_list_sv = SharedVar.new []
    val contextEntryTable : context_entry_table = ContextTable.new ()

    fun getContextEntry key =
      case ContextTable.lookup contextEntryTable key of
        SOME contextEntry => contextEntry
      | NONE => raise Fail "error: context not in table"

    local
      val flagVar : bool SharedVar.t = SharedVar.new false
      fun set _ = true
      fun clear ((), flag) = (flag, false)
    in
      fun skipNextPostGCFinalizer () : unit = SharedVar.map flagVar set
      fun skipThisPostGCFinalizer () : bool = SharedVar.foldmap flagVar clear ()
    end

    fun add (ps', ps) = ((), ps' @ ps)

    fun cleanPendingElems ((), ps) =
      if List.exists (fn {isAlive, ...} => not (isAlive ())) ps
      then
        foldl
          (
            fn (p as {isAlive, runFinalizers}, (runNowFns, ps)) =>
              if isAlive ()
              then (runNowFns, p :: ps)
              else (runFinalizers :: runNowFns, ps)
          )
          ([], [])
          ps
      else
        ([], ps)

    fun printErr s = (
      TextIO.output (TextIO.stdErr, s);
      TextIO.flushOut TextIO.stdErr
    )
    fun reportExn e =
      printErr (concat ["Warning: finalizer raised exception ", exnMessage e, "\n"])
        handle _ => ()

    fun run f = f () handle e => reportExn e

    fun cleanPendingList marshaler pendingList =
      let
        val runNowFns = SharedVar.foldmap pendingList cleanPendingElems ()
        val cleanedSome =
          if not (List.null runNowFns)
          then (marshaler (fn () => app run runNowFns); true)
          else false
      in
        cleanedSome
      end

    fun cleanContextEntry {pendingList, marshaler, ...} =
      case ! marshaler of
        SOME marshaler => cleanPendingList marshaler pendingList
      | NONE           => false

    (* A context entry is needed if the context is alive or there are still
     * pending items.  Note that `!` is not `not`! *)
    fun needContextEntry {isAlive, pendingList, ...} =
      ! isAlive () orelse not (List.null (SharedVar.get pendingList))

    fun marshalNow f = f ()

    fun finalize doGC =
      let
        fun cleanNext (contextEntry, cleanedSome) =
          cleanContextEntry contextEntry orelse cleanedSome

        val () = skipNextPostGCFinalizer ()
        val () = doGC ()
        val cleanedSome'1 = cleanPendingList marshalNow globalPendingList
        val cleanedSome' =
          ContextTable.fold cleanNext (contextEntryTable, cleanedSome'1)
        val () = ignore (ContextTable.filter contextEntryTable needContextEntry)
      in
        cleanedSome'
      end


    fun countPendingList pendingList = List.length (SharedVar.get pendingList)

    fun countContextEntry {pendingList, ...} = countPendingList pendingList

    fun getPendingCounts () =
      let
        fun countNext (contextEntry, counts) =
          countContextEntry contextEntry :: counts

        val globalCount = countPendingList globalPendingList
        val revContextCounts =
          ContextTable.fold countNext (contextEntryTable, [])
      in
        {
          globalCount      = globalCount,
          revContextCounts = revContextCounts
        }
      end


    fun forceCleanPendingElems ((), ps) =
      foldl
        (
          fn ({runFinalizers, ...}, (runNowFns, ps)) =>
            (runFinalizers :: runNowFns, ps)
        )
        ([], [])
        ps

    fun forceCleanPendingList pendingList =
      let
        val runNowFns = SharedVar.foldmap pendingList forceCleanPendingElems ()
        val () = app run runNowFns
      in
        ()
      end

    fun forceCleanContextEntry {pendingList, ...} = forceCleanPendingList pendingList

    fun forceFinalize () =
      let
        val () = forceCleanPendingList globalPendingList
        val () = ContextTable.app forceCleanContextEntry contextEntryTable
      in
        ()
      end


    local
      val onGC =
        fn () =>
          if not (skipThisPostGCFinalizer ())
          then
            let
              val () = ignore (cleanPendingList marshalNow globalPendingList)
              val () =
                ContextTable.app (ignore o cleanContextEntry) contextEntryTable
              val () =
                ignore (ContextTable.filter contextEntryTable needContextEntry)
            in
              ()
            end
          else ()

      fun onExit () =
        let
          val () = while finalize GC.full do ()
        in
          if GiraffeDebug.isEnabled
          then
            let
              val pendingCounts as {globalCount, revContextCounts} = getPendingCounts ()

              val () =
                if GiraffeDebug.logFinalizersPendingOnExitEnabled ()
                then GiraffeDebug.logFinalizersPendingOnExit pendingCounts
                else ()

              val () =
                if GiraffeDebug.forceFinalizationOnExitEnabled ()
                    andalso List.foldl (op +) globalCount revContextCounts > 0
                then forceFinalize ()
                else ()
            in
              ()
            end
          else
            ()
        end

      val () = MLtonSignal.handleGC onGC
      val () = OS.Process.atExit onExit
    in
    end

    structure Context =
      struct
        type t = context_key ref

        type marshaler = context_marshaler

        fun new () =
          let
            val isAlive = ref (Fn.const false)
            val contextEntry =
              {
                pendingList = SharedVar.new [],
                isAlive     = isAlive,
                marshaler   = ref NONE
              }
            val key = ContextTable.insert contextEntryTable contextEntry
            val context = ref key
            val weak = MLton.Weak.new context
            val () = isAlive := (fn () => isSome (MLton.Weak.get weak))
          in
            context
          end

        fun setMarshaler context optMarshaler =
          let
            val ref key = context
            val {marshaler, ...} = getContextEntry key
            val () = marshaler := optMarshaler
          in
            ()
          end

        fun finalize context (marshaler, doGC) =
          let
            val ref key = context
            val {pendingList, ...} = getContextEntry key

            val () = skipNextPostGCFinalizer ()
            val () = doGC ()
            val cleanedSome'1 = cleanPendingList marshalNow globalPendingList
          in
            cleanPendingList marshaler pendingList orelse cleanedSome'1
          end
      end

    fun newInternal (v : 'a) : 'a t * pending =
      let
        val afters = ref []
        val finalizers = ref []
        val value = ref v
        val t =
          T {
            afters = afters,
            finalizers = finalizers,
            value = value
          }
        val weak = MLton.Weak.new value
        fun isAlive () = isSome (MLton.Weak.get weak)
        fun runFinalizers () = (
          List.app (fn f => f v) (! finalizers);
          List.app (fn f => f ()) (! afters)
        )
        val pending =
          {
            isAlive = isAlive,
            runFinalizers = runFinalizers
          }
      in
        (t, pending)
      end

    fun new (v : 'a) : 'a t =
      let
        val (t, pending) = newInternal v
        val () = SharedVar.foldmap globalPendingList add [pending]
      in
        t
      end

    fun newInContext (context : Context.t) (v : 'a) : 'a t =
      let
        val (t, pending) = newInternal v

        val ref key = context
        val {pendingList, ...} = getContextEntry key
        val () = SharedVar.foldmap pendingList add [pending]

        (* Ensure that `context` is referenced until after its associated
         * pending list has been updated.  This ensures that an empty
         * pending list cannot become non-empty if the context is not
         * referenced, so an unreferenced context with an empty pending
         * list can be safely removed. *)
        val () = Primitive.MLton.Finalizable.touch context
      in
        t
      end
  end
