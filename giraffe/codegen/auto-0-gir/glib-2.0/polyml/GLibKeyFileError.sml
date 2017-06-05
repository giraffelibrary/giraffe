structure GLibKeyFileError :>
  G_LIB_KEY_FILE_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      UNKNOWN_ENCODING
    | PARSE
    | NOT_FOUND
    | KEY_NOT_FOUND
    | GROUP_NOT_FOUND
    | INVALID_VALUE
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN_ENCODING
        val toInt =
          fn
            UNKNOWN_ENCODING => 0
          | PARSE => 1
          | NOT_FOUND => 2
          | KEY_NOT_FOUND => 3
          | GROUP_NOT_FOUND => 4
          | INVALID_VALUE => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNKNOWN_ENCODING
          | 1 => PARSE
          | 2 => NOT_FOUND
          | 3 => KEY_NOT_FOUND
          | 4 => GROUP_NOT_FOUND
          | 5 => INVALID_VALUE
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-key-file-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibKeyFileError = GLibKeyFileError.Error
