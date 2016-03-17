structure GLibKeyFileError :>
  sig
    include
      G_LIB_KEY_FILE_ERROR
        where type error_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      UNKNOWN_ENCODING
    | PARSE
    | NOT_FOUND
    | KEY_NOT_FOUND
    | GROUP_NOT_FOUND
    | INVALID_VALUE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            UNKNOWN_ENCODING => f 0
          | PARSE => f 1
          | NOT_FOUND => f 2
          | KEY_NOT_FOUND => f 3
          | GROUP_NOT_FOUND => f 4
          | INVALID_VALUE => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN_ENCODING
          | 1 => PARSE
          | 2 => NOT_FOUND
          | 3 => KEY_NOT_FOUND
          | 4 => GROUP_NOT_FOUND
          | 5 => INVALID_VALUE
          | n => raise Value n
      end
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-key-file-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibKeyFileError = GLibKeyFileError.Error
