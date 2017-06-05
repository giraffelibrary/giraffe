structure GLibOptionError :>
  G_LIB_OPTION_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      UNKNOWN_OPTION
    | BAD_VALUE
    | FAILED
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN_OPTION
        val toInt =
          fn
            UNKNOWN_OPTION => 0
          | BAD_VALUE => 1
          | FAILED => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UNKNOWN_OPTION
          | 1 => BAD_VALUE
          | 2 => FAILED
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-option-context-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibOptionError = GLibOptionError.Error
