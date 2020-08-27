(* Copyright (C) 2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibSourceFunc :> G_LIB_SOURCE_FUNC =
  struct
    type func = unit -> bool
    structure Pointer = CPointer(GMemory)
    structure Closure =
      Closure(
        val name = "GLib.SourceFunc"
        type args = unit
        type ret = GBool.FFI.val_
        val exnRetVal =
          GBool.FFI.withVal I false (* return false to remove the source *)
        val noneRetVal =
          GBool.FFI.withVal I true  (* return true to prevent an attempt
                                     * to remove a non-existent source *)
      )
    structure Callback =
      Callback(
        type t = func
        structure Pointer = Pointer
        structure Closure = Closure
        fun marshaller func =
          fn () =>
            GBool.FFI.withVal I (func ())
        fun dispatchPtr () = _address "giraffe_g_source_func_dispatch" : Pointer.t;
        fun dispatchAsyncPtr () = _address "giraffe_g_source_func_dispatch_async" : Pointer.t;
        fun destroyNotifyPtr () = _address "giraffe_g_source_func_destroy" : Pointer.t;
      )
    open Callback
    val () =
      _export "giraffe_g_source_func_dispatch_sml" : (Closure.t -> GBool.FFI.val_) -> unit;
        (fn closure => Closure.call closure ())
    val () =
      _export "giraffe_g_source_func_dispatch_async_sml" : (Closure.t -> GBool.FFI.val_) -> unit;
        (fn closure => Closure.call closure () before Closure.free closure)
    val () =
      _export "giraffe_g_source_func_destroy_sml" : (Closure.t -> unit) -> unit;
        Closure.free
  end
