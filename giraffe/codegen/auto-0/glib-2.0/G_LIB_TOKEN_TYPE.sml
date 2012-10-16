signature G_LIB_TOKEN_TYPE =
  sig
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
        exception Value of FFI.Enum.val_
      end
  end
