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
    | LEFTPAREN
    | RIGHTPAREN
    | LEFTCURLY
    | RIGHTCURLY
    | LEFTBRACE
    | RIGHTBRACE
    | EQUALSIGN
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
    | IDENTIFIERNULL
    | COMMENTSINGLE
    | COMMENTMULTI
    | LAST
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            EOF => f 0
          | LEFTPAREN => f 40
          | RIGHTPAREN => f 41
          | LEFTCURLY => f 123
          | RIGHTCURLY => f 125
          | LEFTBRACE => f 91
          | RIGHTBRACE => f 93
          | EQUALSIGN => f 61
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
          | IDENTIFIERNULL => f 267
          | COMMENTSINGLE => f 268
          | COMMENTMULTI => f 269
          | LAST => f 270
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => EOF
          | 40 => LEFTPAREN
          | 41 => RIGHTPAREN
          | 123 => LEFTCURLY
          | 125 => RIGHTCURLY
          | 91 => LEFTBRACE
          | 93 => RIGHTBRACE
          | 61 => EQUALSIGN
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
          | 267 => IDENTIFIERNULL
          | 268 => COMMENTSINGLE
          | 269 => COMMENTMULTI
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
