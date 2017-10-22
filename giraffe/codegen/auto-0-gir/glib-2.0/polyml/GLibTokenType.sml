structure GLibTokenType :> G_LIB_TOKEN_TYPE =
  struct
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
    structure Enum =
      Enum(
        type enum = enum
        val null = EOF
        val toInt =
          fn
            EOF => 0
          | LEFT_PAREN => 40
          | RIGHT_PAREN => 41
          | LEFT_CURLY => 123
          | RIGHT_CURLY => 125
          | LEFT_BRACE => 91
          | RIGHT_BRACE => 93
          | EQUAL_SIGN => 61
          | COMMA => 44
          | NONE => 256
          | ERROR => 257
          | CHAR => 258
          | BINARY => 259
          | OCTAL => 260
          | INT => 261
          | HEX => 262
          | FLOAT => 263
          | STRING => 264
          | SYMBOL => 265
          | IDENTIFIER => 266
          | IDENTIFIER_NULL => 267
          | COMMENT_SINGLE => 268
          | COMMENT_MULTI => 269
        exception Value of GInt.t
        val fromInt =
          fn
            0 => EOF
          | 40 => LEFT_PAREN
          | 41 => RIGHT_PAREN
          | 123 => LEFT_CURLY
          | 125 => RIGHT_CURLY
          | 91 => LEFT_BRACE
          | 93 => RIGHT_BRACE
          | 61 => EQUAL_SIGN
          | 44 => COMMA
          | 256 => NONE
          | 257 => ERROR
          | 258 => CHAR
          | 259 => BINARY
          | 260 => OCTAL
          | 261 => INT
          | 262 => HEX
          | 263 => FLOAT
          | 264 => STRING
          | 265 => SYMBOL
          | 266 => IDENTIFIER
          | 267 => IDENTIFIER_NULL
          | 268 => COMMENT_SINGLE
          | 269 => COMMENT_MULTI
          | n => raise Value n
      )
    open Enum
  end
