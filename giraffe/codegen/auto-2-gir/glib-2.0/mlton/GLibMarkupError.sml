structure GLibMarkupError :>
  sig
    include
      G_LIB_MARKUP_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      BADUTF8
    | EMPTY
    | PARSE
    | UNKNOWNELEMENT
    | UNKNOWNATTRIBUTE
    | INVALIDCONTENT
    | MISSINGATTRIBUTE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            BADUTF8 => f 0
          | EMPTY => f 1
          | PARSE => f 2
          | UNKNOWNELEMENT => f 3
          | UNKNOWNATTRIBUTE => f 4
          | INVALIDCONTENT => f 5
          | MISSINGATTRIBUTE => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => BADUTF8
          | 1 => EMPTY
          | 2 => PARSE
          | 3 => UNKNOWNELEMENT
          | 4 => UNKNOWNATTRIBUTE
          | 5 => INVALIDCONTENT
          | 6 => MISSINGATTRIBUTE
          | n => raise Value n
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-markup-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibMarkupError = GLibMarkupError.Error
