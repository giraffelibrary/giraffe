structure GLibIOFunc :>
  sig
    include
      G_LIB_I_O_FUNC
        where type i_o_channel_t = GLibIOChannelRecord.t
        where type i_o_condition_t = GLibIOCondition.t

    structure PolyML :
      sig
        val CALLBACK : FFI.callback PolyMLFFI.conversion
      end
  end =
  struct
    type i_o_channel_t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t

    type t = GLibIOChannelRecord.t * GLibIOCondition.t -> bool

    structure FFI =
      struct
        type callback = (
          (
            GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p,
            GLibIOCondition.FFI.val_
          ) pair
           -> GBool.FFI.val_
        ) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure =
            closure (
              GLibIOChannelRecord.PolyML.cPtr
               &&> GLibIOCondition.PolyML.cVal
               --> GBool.PolyML.cVal
            )
        end
        fun withCallback f callback =
          f (
            makeClosure (
              fn
                (source : GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p)
                 & (condition : GLibIOCondition.FFI.val_)
              =>
                GBool.FFI.withVal I (
                  callback (
                    GLibIOChannelRecord.FFI.fromPtr false source,
                    GLibIOCondition.FFI.fromVal condition
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
