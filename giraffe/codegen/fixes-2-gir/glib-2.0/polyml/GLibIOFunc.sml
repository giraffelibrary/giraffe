structure GLibIOFunc :>
  sig
    include
      G_LIB_I_O_FUNC
        where type i_o_channel_record_t = GLibIOChannelRecord.t
        where type i_o_condition_t = GLibIOCondition.t

    structure PolyML :
      sig
        val CALLBACK : C.callback PolyMLFFI.conversion
      end
  end =
  struct
    type i_o_channel_record_t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t

    type t = GLibIOChannelRecord.t * GLibIOCondition.t -> bool

    structure C =
      struct
        type callback =
          GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
           * GLibIOCondition.C.val_
           -> FFI.Bool.C.val_
        fun withCallback f cf =
          f (
            fn (
              source : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p,
              condition : GLibIOCondition.C.val_
            ) =>
              FFI.Bool.C.withVal I (
                cf (
                  GLibIOChannelRecord.C.fromPtr false source,
                  GLibIOCondition.C.fromVal condition
                )
              )
          )
      end

    structure PolyML =
      struct
        val CALLBACK =
          CInterface.FUNCTION2
            (GLibIOChannelRecord.PolyML.PTR, GLibIOCondition.PolyML.VAL)
            FFI.Bool.PolyML.VAL
      end
  end
