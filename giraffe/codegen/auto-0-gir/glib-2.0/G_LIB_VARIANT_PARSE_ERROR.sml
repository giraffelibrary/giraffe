signature G_LIB_VARIANT_PARSE_ERROR =
  sig
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
    include
      ENUM
        where type t = enum
    exception Error of t
    type error_handler
    val handler : error_handler
  end
