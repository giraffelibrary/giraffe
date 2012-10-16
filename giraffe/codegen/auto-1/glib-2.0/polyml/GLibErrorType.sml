structure GLibErrorType :>
  sig
    include G_LIB_ERROR_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      UNKNOWN
    | UNEXPEOF
    | UNEXPEOFINSTRING
    | UNEXPEOFINCOMMENT
    | NONDIGITINCONST
    | DIGITRADIX
    | FLOATRADIX
    | FLOATMALFORMED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UNKNOWN => f 0
          | UNEXPEOF => f 1
          | UNEXPEOFINSTRING => f 2
          | UNEXPEOFINCOMMENT => f 3
          | NONDIGITINCONST => f 4
          | DIGITRADIX => f 5
          | FLOATRADIX => f 6
          | FLOATMALFORMED => f 7
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN
          | 1 => UNEXPEOF
          | 2 => UNEXPEOFINSTRING
          | 3 => UNEXPEOFINCOMMENT
          | 4 => NONDIGITINCONST
          | 5 => DIGITRADIX
          | 6 => FLOATRADIX
          | 7 => FLOATMALFORMED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = UNKNOWN
  end
