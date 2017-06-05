structure GLibOnceStatus :> G_LIB_ONCE_STATUS =
  struct
    datatype enum =
      NOTCALLED
    | PROGRESS
    | READY
    structure Enum =
      Enum(
        type enum = enum
        val null = NOTCALLED
        val toInt =
          fn
            NOTCALLED => 0
          | PROGRESS => 1
          | READY => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NOTCALLED
          | 1 => PROGRESS
          | 2 => READY
          | n => raise Value n
      )
    open Enum
  end
