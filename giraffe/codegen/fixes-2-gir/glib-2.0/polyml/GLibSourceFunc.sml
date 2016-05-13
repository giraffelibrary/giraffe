structure GLibSourceFunc :>
  sig
    include G_LIB_SOURCE_FUNC

    structure PolyML :
      sig
        val CALLBACK : C.callback PolyMLFFI.conversion
      end
  end =
  struct
    type t = unit -> bool

    structure C =
      struct
        type callback = (unit -> FFI.Bool.C.val_) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure = closure (PolyMLFFI.cVoid --> FFI.Bool.PolyML.cVal)
        end
        fun withCallback f callback =
          f (makeClosure (fn () => FFI.Bool.C.withVal I (callback ())))
      end

    structure PolyML =
      struct
        val CALLBACK = PolyMLFFI.cFunction
      end
  end
