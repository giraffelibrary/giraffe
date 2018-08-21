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
        structure Pointer = CPointerInternal
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
      end

    structure FFI =
      struct
        type notnull = C.notnull
        type 'a p = 'a C.p

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
          val nullClosure = nullClosure
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
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f nullClosure

        local
          open PolyMLFFI
        in
          fun withPtrToDispatch f () = f (symbolAsAddress (getSymbol "giraffe_io_dispatch"))
          fun withOptPtrToDispatch f =
            fn
              true  => withPtrToDispatch f ()
            | false => f Memory.Pointer.null

          fun withPtrToDestroy f () = f (symbolAsAddress (getSymbol "giraffe_io_destroy"))
          fun withOptPtrToDestroy f =
            fn
              true  => withPtrToDestroy f ()
            | false => f Memory.Pointer.null
        end
      end

    structure PolyML =
      struct
        val cPtr = C.Pointer.PolyML.cVal
        val cOptPtr = C.Pointer.PolyML.cOptVal
        val cFunction = PolyMLFFI.cFunction
      end
  end
