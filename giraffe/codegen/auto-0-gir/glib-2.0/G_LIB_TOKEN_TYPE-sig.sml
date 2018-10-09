signature G_LIB_TOKEN_TYPE =
  sig
    datatype enum =
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
    include
      ENUM
        where type t = enum
  end
