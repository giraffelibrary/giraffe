structure GLibVariantParseError :> G_LIB_VARIANT_PARSE_ERROR =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = FAILED
        val toInt =
          fn
            FAILED => 0
          | BASIC_TYPE_EXPECTED => 1
          | CANNOT_INFER_TYPE => 2
          | DEFINITE_TYPE_EXPECTED => 3
          | INPUT_NOT_AT_END => 4
          | INVALID_CHARACTER => 5
          | INVALID_FORMAT_STRING => 6
          | INVALID_OBJECT_PATH => 7
          | INVALID_SIGNATURE => 8
          | INVALID_TYPE_STRING => 9
          | NO_COMMON_TYPE => 10
          | NUMBER_OUT_OF_RANGE => 11
          | NUMBER_TOO_BIG => 12
          | TYPE_ERROR => 13
          | UNEXPECTED_TOKEN => 14
          | UNKNOWN_KEYWORD => 15
          | UNTERMINATED_STRING_CONSTANT => 16
          | VALUE_EXPECTED => 17
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
  end
