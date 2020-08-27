(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibIOFunc :>
  G_LIB_I_O_FUNC
    where type i_o_channel_t = GLibIOChannelRecord.t
    where type i_o_condition_t = GLibIOCondition.t =
  struct
    type i_o_channel_t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t
    type func = i_o_channel_t * i_o_condition_t -> bool
    structure Pointer = CPointer(GMemory)
    structure Closure =
      Closure(
        val name = "GLib.IOFunc"
        type args =
          (
            GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p,
            GLibIOCondition.FFI.val_
          ) pair
        type ret = GBool.FFI.val_
        val exnRetVal =
          GBool.FFI.withVal I false (* return false to remove the source *)
        local
          open PolyMLFFI
        in
          val callbackFunc =
            GLibIOChannelRecord.PolyML.cPtr
             &&> GLibIOCondition.PolyML.cVal
             --> GBool.PolyML.cVal
        end
      )
    structure Callback =
      Callback(
        type t = func
        structure Pointer = Pointer
        structure Closure = Closure
        fun marshaller func =
          fn source & condition =>
            GBool.FFI.withVal I (
              func (
                GLibIOChannelRecord.FFI.fromPtr false source,
                GLibIOCondition.FFI.fromVal condition
              )
            )
        local
          open PolyMLFFI
        in
          fun dispatchPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_i_o_func_dispatch")
          fun dispatchAsyncPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_i_o_func_dispatch_async")
          fun destroyNotifyPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_i_o_func_destroy")
        end
      )
    open Callback
  end
