structure GLibSourceFunc :> G_LIB_SOURCE_FUNC =
  struct
    type func = unit -> bool
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

        type callback = (unit -> GBool.FFI.val_) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure = closure (cVoid --> GBool.PolyML.cVal)
          val nullClosure = nullClosure
        end
        fun withCallback f callback =
          f (makeClosure (fn () => GBool.FFI.withVal I (callback ())))
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f nullClosure

        local
          open PolyMLFFI
        in
          fun withPtrToDispatch f () = f (symbolAsAddress (getSymbol "giraffe_source_dispatch"))
          fun withOptPtrToDispatch f =
            fn
              true  => withPtrToDispatch f ()
            | false => f Memory.Pointer.null

          fun withPtrToDestroy f () = f (symbolAsAddress (getSymbol "giraffe_source_destroy"))
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
