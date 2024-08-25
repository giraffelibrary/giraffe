(* Copyright (C) 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature GIRAFFE_FINALIZE =
  sig
    type g_lib_main_context_t

    (**
     * `enableAsyncInContext optContext optPriority` causes 'thread-local'
     * finalizers to be scheduled by GC to run asynchronously in the main
     * loop of the main context specified by `optContext` using the priority
     * `optPriority`.  `optContext` must specify a main context whose main
     * loop runs in the same thread that calls this function.  If
     * `optContext` is `NONE`, the thread-default main context is used.  If
     * `optPriority` is `NONE`, `GLib.PRIORITY_DEFAULT_IDLE` is used.  The
     * specified main context cannot itself be finalized until
     * `disableAsyncInContext` is subsequently called and there are no
     * finalizers pending.
     *)
    val enableAsyncInContext :
      g_lib_main_context_t option -> LargeInt.int option -> unit

    (**
     * `disableAsyncInContext optContext` prevents further scheduling of
     * finalizers in the main context specified by `optContext`, runs pending
     * events in this main context and performs (thread-local and global)
     * finalization until no more is possible.  `optContext` must specify a
     * main context whose main loop ran in the same thread that calls this
     * function.  If `optContext` is `NONE`, the thread-default main context
     * is used.
     *)
    val disableAsyncInContext : g_lib_main_context_t option -> unit

    (**
     * `flushPendingInContext optContext` runs pending events in the main
     * context specified by `optContext` until no more finalization
     * (thread-local or global) is possible.  `optContext` must specify a
     * main context whose main loop ran in the same thread that calls this
     * function.  If `optContext` is `NONE`, the thread-default main context
     * is used.
     *)
    val flushPendingInContext : g_lib_main_context_t option -> unit

    (**
     * `sync doGC` evaluates the function `doGC` and then synchronously
     * performs finalization (thread-local and global) and returns a flag
     * that indicates whether any finalization occurred.
     *)
    val sync : (unit -> unit) -> bool
  end
