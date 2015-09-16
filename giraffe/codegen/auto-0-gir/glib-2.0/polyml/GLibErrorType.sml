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
    | UNEXP_EOF
    | UNEXP_EOF_IN_STRING
    | UNEXP_EOF_IN_COMMENT
    | NON_DIGIT_IN_CONST
    | DIGIT_RADIX
    | FLOAT_RADIX
    | FLOAT_MALFORMED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            UNKNOWN => f 0
          | UNEXP_EOF => f 1
          | UNEXP_EOF_IN_STRING => f 2
          | UNEXP_EOF_IN_COMMENT => f 3
          | NON_DIGIT_IN_CONST => f 4
          | DIGIT_RADIX => f 5
          | FLOAT_RADIX => f 6
          | FLOAT_MALFORMED => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN
          | 1 => UNEXP_EOF
          | 2 => UNEXP_EOF_IN_STRING
          | 3 => UNEXP_EOF_IN_COMMENT
          | 4 => NON_DIGIT_IN_CONST
          | 5 => DIGIT_RADIX
          | 6 => FLOAT_RADIX
          | 7 => FLOAT_MALFORMED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = UNKNOWN
  end
