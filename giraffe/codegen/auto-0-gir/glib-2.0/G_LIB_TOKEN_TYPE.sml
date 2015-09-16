signature G_LIB_TOKEN_TYPE =
  sig
    datatype t =
      EOF
    | LEFT_PAREN
    | RIGHT_PAREN
    | LEFT_CURLY
    | RIGHT_CURLY
    | LEFT_BRACE
    | RIGHT_BRACE
    | EQUAL_SIGN
    | COMMA
    | NONE
    | ERROR
    | CHAR
    | BINARY
    | OCTAL
    | INT
    | HEX
    | FLOAT
    | STRING
    | SYMBOL
    | IDENTIFIER
    | IDENTIFIER_NULL
    | COMMENT_SINGLE
    | COMMENT_MULTI
    | LAST
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
