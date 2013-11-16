structure GLibKeyFileError :>
  sig
    include
      G_LIB_KEY_FILE_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      UNKNOWNENCODING
    | PARSE
    | NOTFOUND
    | KEYNOTFOUND
    | GROUPNOTFOUND
    | INVALIDVALUE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            UNKNOWNENCODING => f 0
          | PARSE => f 1
          | NOTFOUND => f 2
          | KEYNOTFOUND => f 3
          | GROUPNOTFOUND => f 4
          | INVALIDVALUE => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => UNKNOWNENCODING
          | 1 => PARSE
          | 2 => NOTFOUND
          | 3 => KEYNOTFOUND
          | 4 => GROUPNOTFOUND
          | 5 => INVALIDVALUE
          | n => raise Value n
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-key-file-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibKeyFileError = GLibKeyFileError.Error
