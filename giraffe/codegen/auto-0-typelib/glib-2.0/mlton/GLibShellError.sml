structure GLibShellError :>
  G_LIB_SHELL_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      BAD_QUOTING
    | EMPTY_STRING
    | FAILED
    structure Enum =
      Enum(
        type enum = enum
        val null = BAD_QUOTING
        val toInt =
          fn
            BAD_QUOTING => 0
          | EMPTY_STRING => 1
          | FAILED => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BAD_QUOTING
          | 1 => EMPTY_STRING
          | 2 => FAILED
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-shell-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GLibShellError = GLibShellError.Error
