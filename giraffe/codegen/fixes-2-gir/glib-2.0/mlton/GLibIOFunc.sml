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
    type t = func

    structure C =
      struct
        structure Pointer = CPointer(GMemory)
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
      end

    structure IOCallbackTable = CallbackTable(type callback = t)

    local
      fun dispatch
        (
          channel : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p,
          condition : GLibIOCondition.FFI.val_,
          id : IOCallbackTable.id
        ) : bool =
        case IOCallbackTable.lookup id of
          SOME f => (
            f (GLibIOChannelRecord.FFI.fromPtr false channel, GLibIOCondition.FFI.fromVal condition)
              handle
                e => (
                  GiraffeLog.critical (exnMessage e);
                  false  (* return false to remove the source *)
                )
          )
        | NONE   => (
            GiraffeLog.critical (
              concat [
                "IO source callback error: source function id ",
                IOCallbackTable.fmtId id,
                " is invalid (callback does not exist)\n"
              ]
            );
            true (* return true to prevent an attempt
                  * to remove a non-existent source *)
          )
    in
      val _ =
        _export "giraffe_io_dispatch_smlside"
          : (GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
              * GLibIOCondition.FFI.val_
              * IOCallbackTable.id
              -> bool)
             -> unit;
      dispatch
    end

    val _ = _export "giraffe_io_destroy_smlside" : (IOCallbackTable.id -> unit) -> unit; 
    IOCallbackTable.remove

    structure FFI =
      struct
        type opt = C.opt
        type non_opt = C.non_opt
        type 'a p = 'a C.p

        type callback = IOCallbackTable.id
        fun withCallback f callback =
          let
            val callbackId = IOCallbackTable.add callback
          in
            f callbackId
              handle
                e => (IOCallbackTable.remove callbackId; raise e)
          end
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f IOCallbackTable.nullId

        fun withPtrToDispatch f () =
          f (_address "giraffe_io_dispatch" : 'a p;)
        fun withOptPtrToDispatch f =
          fn
            true  => withPtrToDispatch f ()
          | false => f C.Pointer.null

        fun withPtrToDestroy f () =
          f (_address "giraffe_io_destroy" : 'a p;)
        fun withOptPtrToDestroy f =
          fn
            true  => withPtrToDestroy f ()
          | false => f C.Pointer.null
      end
  end
