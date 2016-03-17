structure GLibMarkupError :>
  sig
    include
      G_LIB_MARKUP_ERROR
        where type error_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      BAD_UTF_8
    | EMPTY
    | PARSE
    | UNKNOWN_ELEMENT
    | UNKNOWN_ATTRIBUTE
    | INVALID_CONTENT
    | MISSING_ATTRIBUTE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            BAD_UTF_8 => f 0
          | EMPTY => f 1
          | PARSE => f 2
          | UNKNOWN_ELEMENT => f 3
          | UNKNOWN_ATTRIBUTE => f 4
          | INVALID_CONTENT => f 5
          | MISSING_ATTRIBUTE => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => BAD_UTF_8
          | 1 => EMPTY
          | 2 => PARSE
          | 3 => UNKNOWN_ELEMENT
          | 4 => UNKNOWN_ATTRIBUTE
          | 5 => INVALID_CONTENT
          | 6 => MISSING_ATTRIBUTE
          | n => raise Value n
      end
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-markup-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibMarkupError = GLibMarkupError.Error
