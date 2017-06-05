structure GLibErrorType :> G_LIB_ERROR_TYPE =
  struct
    datatype enum =
      UNKNOWN
    | UNEXP_EOF
    | UNEXP_EOF_IN_STRING
    | UNEXP_EOF_IN_COMMENT
    | NON_DIGIT_IN_CONST
    | DIGIT_RADIX
    | FLOAT_RADIX
    | FLOAT_MALFORMED
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | UNEXP_EOF => 1
          | UNEXP_EOF_IN_STRING => 2
          | UNEXP_EOF_IN_COMMENT => 3
          | NON_DIGIT_IN_CONST => 4
          | DIGIT_RADIX => 5
          | FLOAT_RADIX => 6
          | FLOAT_MALFORMED => 7
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
  end
