structure GLibTokenType :>
  sig
    include G_LIB_TOKEN_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            EOF => f 0
          | LEFT_PAREN => f 40
          | RIGHT_PAREN => f 41
          | LEFT_CURLY => f 123
          | RIGHT_CURLY => f 125
          | LEFT_BRACE => f 91
          | RIGHT_BRACE => f 93
          | EQUAL_SIGN => f 61
          | COMMA => f 44
          | NONE => f 256
          | ERROR => f 257
          | CHAR => f 258
          | BINARY => f 259
          | OCTAL => f 260
          | INT => f 261
          | HEX => f 262
          | FLOAT => f 263
          | STRING => f 264
          | SYMBOL => f 265
          | IDENTIFIER => f 266
          | IDENTIFIER_NULL => f 267
          | COMMENT_SINGLE => f 268
          | COMMENT_MULTI => f 269
          | LAST => f 270
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
          | 270 => LAST
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = EOF
  end
