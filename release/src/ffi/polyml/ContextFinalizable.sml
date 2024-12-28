(* Copyright (C) 2015-2016, 2018, 2021-2024 Phil Clayton <phil.clayton@veonix.com>
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
    fun touch (T {value, ...}) = Weak.touch value

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
    type pending_list =
      {
        pendings  : pending list,
        notifiers : bool ref list
      }
    type shared_pending_list = pending_list SharedVar.t

    structure ContextTable = WordTable(Word)
    type context_key = ContextTable.key  (* = `word` *)
    type context_marshaler = (unit -> unit) -> unit
    type context_entry =
      {
        pendingList : shared_pending_list,
        isAlive     : (unit -> bool) ref,
        marshaler   : context_marshaler option ref
      }
    type context_entry_table = context_entry ContextTable.t

    val initPendingList = {pendings = [], notifiers = []}

    (* State for finalizable values whose finalization is pending. *)
    val globalPendingList : shared_pending_list = SharedVar.new initPendingList
    val contextEntryTable : context_entry_table = ContextTable.new ()

    fun getContextEntry key =
      case ContextTable.lookup contextEntryTable key of
        SOME contextEntry => contextEntry
      | NONE => raise Fail "error: context not in table"

    fun cleanPendings allowNotifiers ((), pendingList as {pendings, notifiers}) =
      if
        (List.null notifiers orelse allowNotifiers)
         andalso List.exists (fn {isAlive, ...} => not (isAlive ())) pendings
      then
        let
          val (runNowFns, pendings') =
            foldl
              (
                fn (pending as {isAlive, runFinalizers}, (runNowFns, pendings)) =>
                  if isAlive ()
                  then (runNowFns, pending :: pendings)
                  else (runFinalizers :: runNowFns, pendings)
              )
              ([], [])
              pendings

          val () = List.app (fn notifier => notifier := true) notifiers
        in
          (runNowFns, {pendings = pendings', notifiers = notifiers})
        end
      else
        ([], pendingList)

    fun printErr s = (
      TextIO.output (TextIO.stdErr, s);
      TextIO.flushOut TextIO.stdErr
    )
    fun reportExn e =
      printErr (concat ["Warning: finalizer raised exception ", exnMessage e, "\n"])
        handle _ => ()

    fun run f = f () handle e => reportExn e

    fun cleanPendingList allowNotifiers marshaler pendingList =
      let
        open Thread.Thread
        val attrs = getAttributes ()
        val () = setAttributes [InterruptState InterruptDefer]

        val runNowFns = SharedVar.foldmap pendingList (cleanPendings allowNotifiers) ()
        val () =
          if not (List.null runNowFns)
          then marshaler (fn () => List.app run runNowFns)
          else ()

        val () = setAttributes attrs
      in
        ()
      end

    fun cleanContextEntry allowNotifiers {pendingList, marshaler, ...} =
      case ! marshaler of
        SOME marshaler => cleanPendingList allowNotifiers marshaler pendingList
      | NONE           => ()

    (* A context entry is needed if the context is alive or there are still
     * pending items.  Note that `!` is not `not`! *)
    fun needContextEntry {isAlive, pendingList, ...} =
      ! isAlive () orelse not (List.null (#pendings (SharedVar.get pendingList)))

    fun marshalNow f = f ()

    fun splitAt (x, xs) =
      let
        fun step (zs, ys) =
          case ys of
            []       => ([], xs)
          | y :: ys' =>
              if x = y
              then (zs, ys')
              else step (y :: zs, ys')
      in
        step ([], xs)
      end

    fun removeFirst (x, xs) = List.revAppend (splitAt (x, xs))

    fun addNotifier notifier {pendings, notifiers} =
      {pendings = pendings, notifiers = notifier :: notifiers}

    fun removeNotifier notifier {pendings, notifiers} =
      {pendings = pendings, notifiers = removeFirst (notifier, notifiers)}

    fun addPendingListNotifier notifier pendingList =
      SharedVar.map pendingList (addNotifier notifier)

    fun removePendingListNotifier notifier pendingList =
      SharedVar.map pendingList (removeNotifier notifier)

    fun addContextEntryNotifier notifier {pendingList, ...} =
      addPendingListNotifier notifier pendingList

    fun removeContextEntryNotifier notifier {pendingList, ...} =
      removePendingListNotifier notifier pendingList

    fun finalize doGC =
      let
        val n = ref false
      in
        let
          val () = addPendingListNotifier n globalPendingList
          val () = ContextTable.app (addContextEntryNotifier n) contextEntryTable

          val () = doGC ()
          val () = cleanPendingList true marshalNow globalPendingList
          val () = ContextTable.app (cleanContextEntry true) contextEntryTable

          val () = removePendingListNotifier n globalPendingList
          val () = ContextTable.app (removeContextEntryNotifier n) contextEntryTable

          val () = ignore (ContextTable.filter contextEntryTable needContextEntry)
        in
          ! n
        end
          handle e =>
            (* ensure notifier `n` is removed *)
            (
              removePendingListNotifier n globalPendingList;
              ContextTable.app (removeContextEntryNotifier n) contextEntryTable;
              raise e
            )
      end

    fun countPendingList pendingList = List.length (#pendings (SharedVar.get pendingList))

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


    fun revMap f =
      let
        fun step res =
          fn
            []      => res
          | x :: xs => step (f x :: res) xs
      in
        step []
      end

    fun forceCleanPendings ((), {pendings, notifiers}) =
      let
        val (runNowFns, pendings') = (revMap #runFinalizers pendings, [])
        val () = List.app (fn notifier => notifier := true) notifiers
      in
        (runNowFns, {pendings = pendings', notifiers = notifiers})
      end

    fun forceCleanPendingList marshaler pendingList =
      let
        val runNowFns = SharedVar.foldmap pendingList forceCleanPendings ()
        val () = marshaler (fn () => List.app run runNowFns)
      in
        ()
      end

    fun forceCleanContextEntry {pendingList, marshaler, ...} =
      case ! marshaler of
        SOME marshaler => forceCleanPendingList marshaler pendingList
      | NONE           => forceCleanPendingList marshalNow pendingList


    local
      fun threadFn () = (
        Thread.Mutex.lock Weak.weakLock;
        while true do (
          let
            val () = cleanPendingList false marshalNow globalPendingList
            val () = ContextTable.app (cleanContextEntry false) contextEntryTable
            val () =
              ignore (ContextTable.filter contextEntryTable needContextEntry)
          in
            ()
          end;
          Thread.ConditionVar.wait (Weak.weakSignal, Weak.weakLock)
        )
      )

      fun onExit () =
        let
          val () = while finalize Giraffe.GC.full do ()
        in
          if Giraffe.Debug.isEnabled
          then
            let
              val pendingCounts as {globalCount, revContextCounts} = getPendingCounts ()

              val () =
                if Giraffe.Debug.logFinalizersPendingOnExitEnabled ()
                then Giraffe.Debug.logFinalizersPendingOnExit pendingCounts
                else ()

              val () =
                if Giraffe.Debug.forceFinalizationOnExitEnabled ()
                    andalso List.foldl (op +) globalCount revContextCounts > 0
                then
                  (
                    forceCleanPendingList marshalNow globalPendingList;
                    ContextTable.app forceCleanContextEntry contextEntryTable
                  )
                else ()
            in
              ()
            end
          else
            ()
        end

      fun startUp () = (
        Thread.Thread.fork (threadFn, []);
        OS.Process.atExit onExit
      )
    in
      val () = PolyML.onEntry startUp; (* For future sessions *)
      val () = startUp() (* For this session *)
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
                pendingList = SharedVar.new initPendingList,
                isAlive     = isAlive,
                marshaler   = ref NONE
              }
            val key = ContextTable.insert contextEntryTable contextEntry
            val context = ref key
            val weak = Weak.weak (SOME context)
            val () = isAlive := (fn () => isSome (! weak))
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

            val n = ref false
          in
            let

              val () = addPendingListNotifier n globalPendingList
              val () = addPendingListNotifier n pendingList

              val () = doGC ()
              val () = cleanPendingList true marshalNow globalPendingList
              val () = cleanPendingList true marshaler pendingList

              val () = removePendingListNotifier n globalPendingList
              val () = removePendingListNotifier n pendingList
            in
              ! n
            end
              handle e =>
                (* ensure notifier `n` is removed *)
                (
                  removePendingListNotifier n globalPendingList;
                  removePendingListNotifier n pendingList;
                  raise e
                )
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
        val weak = Weak.weak (SOME value)
        fun isAlive () = isSome (! weak)
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

    fun add pendings' {pendings, notifiers} =
      {pendings = pendings' @ pendings, notifiers = notifiers}

    fun new (v : 'a) : 'a t =
      let
        val (t, pending) = newInternal v
        val () = SharedVar.map globalPendingList (add [pending])
      in
        t
      end

    fun newInContext (context : Context.t) (v : 'a) : 'a t =
      let
        val (t, pending) = newInternal v

        val ref key = context
        val {pendingList, ...} = getContextEntry key
        val () = SharedVar.map pendingList (add [pending])

        (* Ensure that `context` is referenced until after its associated
         * pending list has been updated.  This ensures that an empty
         * pending list cannot become non-empty if the context is not
         * referenced, so an unreferenced context with an empty pending
         * list can be safely removed. *)
        val () = Weak.touch context
      in
        t
      end
  end
