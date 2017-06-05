structure GLibThreadError :>
  G_LIB_THREAD_ERROR
    where type error_handler = GLibErrorRecord.handler =
  struct
    datatype enum =
      THREAD_ERROR_AGAIN
    structure Enum =
      Enum(
        type enum = enum
        val null = THREAD_ERROR_AGAIN
        val toInt = fn THREAD_ERROR_AGAIN => 0
        exception Value of GInt.t
        val fromInt =
          fn
            0 => THREAD_ERROR_AGAIN
          | n => raise Value n
      )
    open Enum
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g_thread_error",
          FFI.fromVal,
          Error
        )
  end
exception GLibThreadError = GLibThreadError.Error
