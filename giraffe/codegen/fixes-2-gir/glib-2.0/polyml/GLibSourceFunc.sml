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
        local
          open PolyMLFFI
        in
          val callbackFunc = cVoid --> GBool.PolyML.cVal
        end
      )
    structure Callback =
      Callback(
        type t = func
        structure Pointer = Pointer
        structure Closure = Closure
        fun marshaller func =
          fn () =>
            GBool.FFI.withVal I (func ())
        local
          open PolyMLFFI
        in
          fun dispatchPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_source_func_dispatch")
          fun dispatchAsyncPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_source_func_dispatch_async")
          fun destroyNotifyPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_source_func_destroy")
        end
      )
    open Callback
  end
