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
    fun dispatch (pid & status & closure) = Closure.call closure (pid & status)
    fun dispatchAsync (pid & status & closure) =
      Closure.call closure (pid & status) before Closure.free closure
    fun destroyNotify closure = Closure.free closure
    structure Callback =
      Callback(
        type t = func
        structure Closure = Closure
        fun marshaller func =
          fn pid & status =>
            func (GLibPid.FFI.fromVal pid, GInt32.FFI.fromVal status)
        type dispatch_args =
          (GLibPid.FFI.val_, (GInt32.FFI.val_, Closure.t) pair) pair
        local
          open PolyMLFFI
          val dispatchFunc =
            GLibPid.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> Closure.PolyML.cVal
             --> cVoid
          val destroyNotifyFunc = Closure.PolyML.cVal --> cVoid
        in
          val dispatchPtr = closure dispatchFunc dispatch
          val dispatchAsyncPtr = closure dispatchFunc dispatchAsync
          val destroyNotifyPtr = closure destroyNotifyFunc destroyNotify
        end
      )
    open Callback
  end
