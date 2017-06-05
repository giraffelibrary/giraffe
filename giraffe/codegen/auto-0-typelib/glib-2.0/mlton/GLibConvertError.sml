structure GLibConvertError :>
  G_LIB_CONVERT_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      NO_CONVERSION
    | ILLEGAL_SEQUENCE
    | FAILED
    | PARTIAL_INPUT
    | BAD_URI
    | NOT_ABSOLUTE_PATH
    structure Enum =
      Enum(
        type enum = enum
        val null = NO_CONVERSION
        val toInt =
          fn
            NO_CONVERSION => 0
          | ILLEGAL_SEQUENCE => 1
          | FAILED => 2
          | PARTIAL_INPUT => 3
          | BAD_URI => 4
          | NOT_ABSOLUTE_PATH => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NO_CONVERSION
          | 1 => ILLEGAL_SEQUENCE
          | 2 => FAILED
          | 3 => PARTIAL_INPUT
          | 4 => BAD_URI
          | 5 => NOT_ABSOLUTE_PATH
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g_convert_error",
          FFI.fromVal,
          Error
        )
  end
exception GLibConvertError = GLibConvertError.Error
