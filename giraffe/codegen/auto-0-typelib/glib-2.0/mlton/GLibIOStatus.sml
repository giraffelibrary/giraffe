structure GLibIOStatus :> G_LIB_I_O_STATUS =
  struct
    datatype enum =
      ERROR
    | NORMAL
    | EOF
    | AGAIN
    structure Enum =
      Enum(
        type enum = enum
        val null = ERROR
        val toInt =
          fn
            ERROR => 0
          | NORMAL => 1
          | EOF => 2
          | AGAIN => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ERROR
          | 1 => NORMAL
          | 2 => EOF
          | 3 => AGAIN
          | n => raise Value n
      )
    open Enum
  end
