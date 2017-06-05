structure GLibIOFunc :>
  sig
    include
      G_LIB_I_O_FUNC
        where type i_o_channel_t = GLibIOChannelRecord.t
        where type i_o_condition_t = GLibIOCondition.t
  end =
  struct
    type i_o_channel_t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t

    type t = GLibIOChannelRecord.t * GLibIOCondition.t -> bool

    structure IOCallback = Callback (type callback = t)

    local
      fun dispatch
        (
          channel : GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p,
          condition : GLibIOCondition.FFI.val_,
          id : IOCallback.id
        ) : bool =
        case IOCallback.lookup id of
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
                IOCallback.fmtId id,
                " is invalid (callback does not exist)\n"
              ]
            );
            true (* return true to prevent an attempt
                  * to remove a non-existent source *)
          )
    in
      val _ =
        _export "giraffe_io_dispatch_smlside"
          : (GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p
              * GLibIOCondition.FFI.val_
              * IOCallback.id
              -> bool)
             -> unit;
      dispatch
    end

    val _ = _export "giraffe_io_destroy_smlside" : (IOCallback.id -> unit) -> unit; 
    IOCallback.remove

    structure FFI =
      struct
        type callback = IOCallback.id
        fun withCallback f callback =
          let
            val callbackId = IOCallback.add callback
          in
            f callbackId
              handle
                e => (IOCallback.remove callbackId; raise e)
          end
      end
  end
