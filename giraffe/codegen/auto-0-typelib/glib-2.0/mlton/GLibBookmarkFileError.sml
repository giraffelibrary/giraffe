structure GLibBookmarkFileError :>
  G_LIB_BOOKMARK_FILE_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      INVALID_URI
    | INVALID_VALUE
    | APP_NOT_REGISTERED
    | URI_NOT_FOUND
    | READ
    | UNKNOWN_ENCODING
    | WRITE
    | FILE_NOT_FOUND
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID_URI
        val toInt =
          fn
            INVALID_URI => 0
          | INVALID_VALUE => 1
          | APP_NOT_REGISTERED => 2
          | URI_NOT_FOUND => 3
          | READ => 4
          | UNKNOWN_ENCODING => 5
          | WRITE => 6
          | FILE_NOT_FOUND => 7
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-bookmark-file-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibBookmarkFileError = GLibBookmarkFileError.Error
