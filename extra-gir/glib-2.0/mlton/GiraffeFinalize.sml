(* Copyright (C) 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GiraffeFinalize :>
  GIRAFFE_FINALIZE
    where type g_lib_main_context_t = GLib.MainContext.t =
  struct
    type g_lib_main_context_t = GLib.MainContext.t

    fun marshaler context priority f =
      let
        open MLton.Thread
      in
        case atomicState () of
          AtomicState.NonAtomic => f ()
        | AtomicState.Atomic _ =>
            let
              val source = GLib.idleSourceNew (fn () => (f (); GLib.SOURCE_REMOVE))
              val () = GLib.Source.setPriority source priority
              val _ = GLib.Source.attach source (SOME context)
            in
              ()
            end
      end

    val getContext =
      fn
          NONE         => GLib.MainContext.refThreadDefault ()
        | SOME context => context

    fun enableAsyncInContext optContext optPriority =
      let
        val context = getContext optContext
        val priority =
          case optPriority of
              NONE          => GLib.PRIORITY_DEFAULT_IDLE
            | SOME priority => priority

        val () = ThreadFinalizable.Thread.setMarshaler (SOME (marshaler context priority))
      in
        ()
      end

    fun flushPendingInContext optContext =
      let
        val context = getContext optContext
        val priority = GLib.PRIORITY_DEFAULT_IDLE

        (* After the main loop of `context` has stopped, no further
         * asynchronous finalization can run but there may be pending
         * finalizers that need to be run in the current thread.  Therefore
         * pending events in `context` are run until running GC and
         * finalizers (synchronously) performs no further finalization.
         *)
        val () = while GLib.MainContext.iteration context false do ()
        val () =
          while ThreadFinalizable.Thread.finalize (marshaler context priority, GC.full)
          do
            while GLib.MainContext.iteration context false do ()
      in
        ()
      end

    fun disableAsyncInContext optContext =
      let
        (* Ensure no more finalization is scheduled on GC. *)
        val () = ThreadFinalizable.Thread.setMarshaler NONE

        val () = flushPendingInContext optContext
      in
        ()
      end

    fun sync doGC = ThreadFinalizable.Thread.finalize (fn f => f (), doGC)
  end
