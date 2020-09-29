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
        val noneRetVal =
          GBool.FFI.withVal I true  (* return true to prevent an attempt
                                     * to remove a non-existent source *)
      )
    fun dispatch (source & condition & closure) = Closure.call closure (source & condition)
    fun dispatchAsync (source & condition & closure) =
      Closure.call closure (source & condition) before Closure.free closure
    fun destroyNotify closure = Closure.free closure
    structure Callback =
      Callback(
        type t = func
        structure Closure = Closure
        fun marshaller func =
          fn source & condition =>
            GBool.FFI.withVal I (
              func (
                GLibIOChannelRecord.FFI.fromPtr false source,
                GLibIOCondition.FFI.fromVal condition
              )
            )
        type dispatch_args =
          (
            GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p,
            (
              GLibIOCondition.FFI.val_,
              Closure.t
            ) pair
          ) pair
        local
          open PolyMLFFI
          val dispatchFunc =
            GLibIOChannelRecord.PolyML.cPtr
             &&> GLibIOCondition.PolyML.cVal
             &&> Closure.PolyML.cVal
             --> GBool.PolyML.cVal
          val destroyNotifyFunc = Closure.PolyML.cVal --> cVoid
        in
          val dispatchPtr = closure dispatchFunc dispatch
          val dispatchAsyncPtr = closure dispatchFunc dispatchAsync
          val destroyNotifyPtr = closure destroyNotifyFunc destroyNotify
        end
      )
    open Callback
  end
