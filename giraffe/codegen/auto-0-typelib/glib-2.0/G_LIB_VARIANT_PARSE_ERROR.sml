signature G_LIB_VARIANT_PARSE_ERROR =
  sig
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
    val null : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
