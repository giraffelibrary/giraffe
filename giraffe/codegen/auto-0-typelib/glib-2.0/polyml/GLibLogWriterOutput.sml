structure GLibLogWriterOutput :> G_LIB_LOG_WRITER_OUTPUT =
  struct
    datatype enum =
      HANDLED
    | UNHANDLED
    structure Enum =
      Enum(
        type enum = enum
        val null = HANDLED
        val toInt =
          fn
            HANDLED => 1
          | UNHANDLED => 0
        exception Value of GInt32.t
        val fromInt =
          fn
            1 => HANDLED
          | 0 => UNHANDLED
          | n => raise Value n
      )
    open Enum
  end
