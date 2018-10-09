signature G_LIB_ERROR_TYPE =
  sig
    datatype enum =
      UNKNOWN
    | UNEXP_EOF
    | UNEXP_EOF_IN_STRING
    | UNEXP_EOF_IN_COMMENT
    | NON_DIGIT_IN_CONST
    | DIGIT_RADIX
    | FLOAT_RADIX
    | FLOAT_MALFORMED
    include
      ENUM
        where type t = enum
  end
