structure GLibVariantParseError :>
  sig
    include G_LIB_VARIANT_PARSE_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      FAILED
    | BASIC_TYPE_EXPECTED
    | CANNOT_INFER_TYPE
    | DEFINITE_TYPE_EXPECTED
    | INPUT_NOT_AT_END
    | INVALID_CHARACTER
    | INVALID_FORMAT_STRING
    | INVALID_OBJECT_PATH
    | INVALID_SIGNATURE
    | INVALID_TYPE_STRING
    | NO_COMMON_TYPE
    | NUMBER_OUT_OF_RANGE
    | NUMBER_TOO_BIG
    | TYPE_ERROR
    | UNEXPECTED_TOKEN
    | UNKNOWN_KEYWORD
    | UNTERMINATED_STRING_CONSTANT
    | VALUE_EXPECTED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            FAILED => f 0
          | BASIC_TYPE_EXPECTED => f 1
          | CANNOT_INFER_TYPE => f 2
          | DEFINITE_TYPE_EXPECTED => f 3
          | INPUT_NOT_AT_END => f 4
          | INVALID_CHARACTER => f 5
          | INVALID_FORMAT_STRING => f 6
          | INVALID_OBJECT_PATH => f 7
          | INVALID_SIGNATURE => f 8
          | INVALID_TYPE_STRING => f 9
          | NO_COMMON_TYPE => f 10
          | NUMBER_OUT_OF_RANGE => f 11
          | NUMBER_TOO_BIG => f 12
          | TYPE_ERROR => f 13
          | UNEXPECTED_TOKEN => f 14
          | UNKNOWN_KEYWORD => f 15
          | UNTERMINATED_STRING_CONSTANT => f 16
          | VALUE_EXPECTED => f 17
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => FAILED
          | 1 => BASIC_TYPE_EXPECTED
          | 2 => CANNOT_INFER_TYPE
          | 3 => DEFINITE_TYPE_EXPECTED
          | 4 => INPUT_NOT_AT_END
          | 5 => INVALID_CHARACTER
          | 6 => INVALID_FORMAT_STRING
          | 7 => INVALID_OBJECT_PATH
          | 8 => INVALID_SIGNATURE
          | 9 => INVALID_TYPE_STRING
          | 10 => NO_COMMON_TYPE
          | 11 => NUMBER_OUT_OF_RANGE
          | 12 => NUMBER_TOO_BIG
          | 13 => TYPE_ERROR
          | 14 => UNEXPECTED_TOKEN
          | 15 => UNKNOWN_KEYWORD
          | 16 => UNTERMINATED_STRING_CONSTANT
          | 17 => VALUE_EXPECTED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = FAILED
  end
