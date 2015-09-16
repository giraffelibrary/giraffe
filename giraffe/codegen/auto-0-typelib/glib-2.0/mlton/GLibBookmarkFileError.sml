structure GLibBookmarkFileError :>
  sig
    include
      G_LIB_BOOKMARK_FILE_ERROR
        where type error_record_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      INVALID_URI
    | INVALID_VALUE
    | APP_NOT_REGISTERED
    | URI_NOT_FOUND
    | READ
    | UNKNOWN_ENCODING
    | WRITE
    | FILE_NOT_FOUND
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID_URI => f 0
          | INVALID_VALUE => f 1
          | APP_NOT_REGISTERED => f 2
          | URI_NOT_FOUND => f 3
          | READ => f 4
          | UNKNOWN_ENCODING => f 5
          | WRITE => f 6
          | FILE_NOT_FOUND => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID_URI
          | 1 => INVALID_VALUE
          | 2 => APP_NOT_REGISTERED
          | 3 => URI_NOT_FOUND
          | 4 => READ
          | 5 => UNKNOWN_ENCODING
          | 6 => WRITE
          | 7 => FILE_NOT_FOUND
          | n => raise Value n
      end
    exception Error of t
    type error_record_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-bookmark-file-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibBookmarkFileError = GLibBookmarkFileError.Error
