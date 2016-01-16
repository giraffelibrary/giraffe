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
        type callback = (
          (
            GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p,
            GLibIOCondition.C.val_
          ) pair
           -> FFI.Bool.C.val_
        ) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure =
            closure (
              GLibIOChannelRecord.PolyML.PTR
               &&> GLibIOCondition.PolyML.VAL
               --> FFI.Bool.PolyML.VAL
            )
        end
        fun withCallback f callback =
          f (
            makeClosure (
              fn
                (source : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p)
                 & (condition : GLibIOCondition.C.val_)
              =>
                FFI.Bool.C.withVal I (
                  callback (
                    GLibIOChannelRecord.C.fromPtr false source,
                    GLibIOCondition.C.fromVal condition
                  )
                )
            )
          )
      end

    structure PolyML =
      struct
        val CALLBACK = PolyMLFFI.cFunction
      end
  end
