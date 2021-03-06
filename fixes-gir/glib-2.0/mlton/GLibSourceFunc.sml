(* Copyright (C) 2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibSourceFunc :> G_LIB_SOURCE_FUNC =
  struct
    type func = unit -> bool
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
    fun dispatch closure = Closure.call closure ()
    fun dispatchAsync closure = Closure.call closure () before Closure.free closure
    fun destroyNotify closure = Closure.free closure
    val () =
      _export "giraffe_g_source_func_dispatch" private
        : (Closure.t -> GBool.FFI.val_) -> unit;
        dispatch
    val () =
      _export "giraffe_g_source_func_dispatch_async" private
        : (Closure.t -> GBool.FFI.val_) -> unit;
        dispatchAsync
    val () =
      _export "giraffe_g_source_func_destroy" private
        : (Closure.t -> unit) -> unit;
        destroyNotify
    structure Callback =
      Callback(
        type t = func
        structure Closure = Closure
        fun marshaller func =
          fn () =>
            GBool.FFI.withVal I (func ())
        structure Pointer = CPointer(GMemory)
        val dispatchPtr = _address "giraffe_g_source_func_dispatch" private : Pointer.t;
        val dispatchAsyncPtr = _address "giraffe_g_source_func_dispatch_async" private : Pointer.t;
        val destroyNotifyPtr = _address "giraffe_g_source_func_destroy" private : Pointer.t;
      )
    open Callback
  end
