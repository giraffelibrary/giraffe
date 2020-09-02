(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibChildWatchFunc :>
  G_LIB_CHILD_WATCH_FUNC
    where type pid_t = GLibPid.t =
  struct
    type pid_t = GLibPid.t
    type func = pid_t * LargeInt.int -> unit
    structure Closure =
      Closure(
        val name = "GLib.ChildWatchFunc"
        type args = (GLibPid.FFI.val_, GInt32.FFI.val_) pair
        type ret = unit
        val exnRetVal = ()
        val noneRetVal = ()
      )
    fun dispatch (pid, status, closure) = Closure.call closure (pid & status)
    fun dispatchAsync (pid, status, closure) =
      Closure.call closure (pid & status) before Closure.free closure
    fun destroyNotify closure = Closure.free closure
    val () =
      _export "giraffe_g_child_watch_func_dispatch" private
        : (GLibPid.FFI.val_
            * GInt32.FFI.val_
            * Closure.t
            -> unit)
           -> unit;
        dispatch
    val () =
      _export "giraffe_g_child_watch_func_dispatch_async" private
        : (GLibPid.FFI.val_
            * GInt32.FFI.val_
            * Closure.t
            -> unit)
           -> unit;
        dispatchAsync
    val () =
      _export "giraffe_g_child_watch_func_destroy" private
        : (Closure.t -> unit) -> unit;
        destroyNotify
    structure Callback =
      Callback(
        type t = func
        structure Pointer = CPointer(GMemory)
        structure Closure = Closure
        fun marshaller func =
          fn pid & status =>
            func (GLibPid.FFI.fromVal pid, GInt32.FFI.fromVal status)
        val dispatchPtr = _address "giraffe_g_child_watch_func_dispatch" private : Pointer.t;
        val dispatchAsyncPtr = _address "giraffe_g_child_watch_func_dispatch_async" private : Pointer.t;
        val destroyNotifyPtr = _address "giraffe_g_child_watch_func_destroy" private : Pointer.t;
      )
    open Callback
  end
