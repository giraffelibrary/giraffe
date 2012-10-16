structure GLibIOFunc :>
  sig
    include
      G_LIB_I_O_FUNC
        where type iochannelrecord_t = GLibIOChannelRecord.t
        where type iocondition_t = GLibIOCondition.t

    structure PolyML :
      sig
        val CALLBACK : C.callback CInterface.Conversion
      end
  end =
  struct
    type iochannelrecord_t = GLibIOChannelRecord.t
    type iocondition_t = GLibIOCondition.t

    type t = GLibIOChannelRecord.t * GLibIOCondition.t -> bool

    structure C =
      struct
        type callback =
          GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
           * GLibIOCondition.C.val_
           -> bool
        fun withCallback f callback =
          FFI.withVal f (
            fn (
              source : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p,
              condition : GLibIOCondition.C.val_
            ) =>
              callback (
                GLibIOChannelRecord.C.fromPtr false source,
                GLibIOCondition.C.fromVal condition
              )
          )
      end

    structure PolyML =
      struct
        val CALLBACK =
          CInterface.FUNCTION2
            (GLibIOChannelRecord.PolyML.PTR, GLibIOCondition.PolyML.VAL)
            FFI.PolyML.Bool.VAL
      end
  end
