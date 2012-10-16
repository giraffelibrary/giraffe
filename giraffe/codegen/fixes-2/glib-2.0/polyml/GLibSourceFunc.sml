structure GLibSourceFunc :>
  sig
    include G_LIB_SOURCE_FUNC

    structure PolyML :
      sig
        val CALLBACK : C.callback CInterface.Conversion
      end
  end =
  struct
    type t = unit -> bool

    structure C =
      struct
        type callback = t
        val withCallback = FFI.withVal
      end

    structure PolyML =
      struct
        val CALLBACK = CInterface.FUNCTION1 FFI.PolyML.VOID FFI.PolyML.Bool.VAL
      end
  end
