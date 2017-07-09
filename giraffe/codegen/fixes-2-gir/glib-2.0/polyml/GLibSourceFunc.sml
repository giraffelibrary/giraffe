structure GLibSourceFunc :>
  sig
    include G_LIB_SOURCE_FUNC

    structure PolyML :
      sig
        val CALLBACK : FFI.callback PolyMLFFI.conversion
      end
  end =
  struct
    type t = unit -> bool

    structure FFI =
      struct
        type callback = (unit -> GBool.FFI.val_) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure = closure (cVoid --> GBool.PolyML.cVal)
        end
        fun withCallback f callback =
          f (makeClosure (fn () => GBool.FFI.withVal I (callback ())))
      end

    structure PolyML =
      struct
        val CALLBACK = PolyMLFFI.cFunction
      end
  end
