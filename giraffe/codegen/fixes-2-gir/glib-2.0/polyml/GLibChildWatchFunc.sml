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
    structure Pointer = CPointer(GMemory)
    structure Closure =
      Closure(
        val name = "GLib.ChildWatchFunc"
        type args = (GLibPid.FFI.val_, GInt32.FFI.val_) pair
        type ret = unit
        val exnRetVal = ()
        local
          open PolyMLFFI
        in
          val callbackFunc = GLibPid.PolyML.cVal &&> GInt32.PolyML.cVal --> cVoid
        end
      )
    structure Callback =
      Callback(
        type t = func
        structure Pointer = Pointer
        structure Closure = Closure
        fun marshaller func =
          fn pid & status =>
            func (GLibPid.FFI.fromVal pid, GInt32.FFI.fromVal status)
        local
          open PolyMLFFI
        in
          fun dispatchPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_child_watch_func_dispatch")
          fun dispatchAsyncPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_child_watch_func_dispatch_async")
          fun destroyNotifyPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_child_watch_func_destroy")
        end
      )
    open Callback
  end
