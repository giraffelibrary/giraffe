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
        type callback = unit -> FFI.Bool.C.val_
        fun withCallback f cf = f (fn () => FFI.Bool.C.withVal I (cf ()))
      end

    structure PolyML =
      struct
        val CALLBACK = CInterface.FUNCTION1 FFI.PolyML.VOID FFI.Bool.PolyML.VAL
      end
  end
