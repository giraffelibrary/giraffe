structure GLibTimeType :>
  sig
    include G_LIB_TIME_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      STANDARD
    | DAYLIGHT
    | UNIVERSAL
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            STANDARD => f 0
          | DAYLIGHT => f 1
          | UNIVERSAL => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => STANDARD
          | 1 => DAYLIGHT
          | 2 => UNIVERSAL
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = STANDARD
  end
