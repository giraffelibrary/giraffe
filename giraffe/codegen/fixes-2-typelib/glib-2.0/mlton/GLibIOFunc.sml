structure GLibIOFunc :>
  sig
    include
      G_LIB_I_O_FUNC
        where type iochannelrecord_t = GLibIOChannelRecord.t
        where type iocondition_t = GLibIOCondition.t
  end =
  struct
    type iochannelrecord_t = GLibIOChannelRecord.t
    type iocondition_t = GLibIOCondition.t

    type t = GLibIOChannelRecord.t * GLibIOCondition.t -> bool

    structure IOCallback = Callback (type callback = t)

    local
      fun dispatch
        (
          channel : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p,
          condition : GLibIOCondition.C.val_,
          id : IOCallback.id
        ) : bool =
        case IOCallback.lookup id of
          SOME f => (
            f (GLibIOChannelRecord.C.fromPtr false channel, GLibIOCondition.C.fromVal condition)
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
          : (GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
              * GLibIOCondition.C.val_
              * IOCallback.id
              -> bool)
             -> unit;
      dispatch
    end

    val _ = _export "giraffe_io_destroy_smlside" : (IOCallback.id -> unit) -> unit; 
    IOCallback.remove

    structure C =
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
