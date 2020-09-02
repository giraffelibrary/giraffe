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
    structure Callback =
      Callback(
        type t = func
        structure Closure = Closure
        fun marshaller func =
          fn () =>
            GBool.FFI.withVal I (func ())
        type dispatch_args = Closure.t
        local
          open PolyMLFFI
          val dispatchFunc = Closure.PolyML.cVal --> GBool.PolyML.cVal
          val destroyNotifyFunc = Closure.PolyML.cVal --> cVoid
        in
          val dispatchPtr = closure dispatchFunc dispatch
          val dispatchAsyncPtr = closure dispatchFunc dispatchAsync
          val destroyNotifyPtr = closure destroyNotifyFunc destroyNotify
        end
      )
    open Callback
  end
