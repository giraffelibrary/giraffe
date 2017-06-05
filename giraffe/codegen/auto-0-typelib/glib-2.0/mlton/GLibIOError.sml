structure GLibIOError :> G_LIB_I_O_ERROR =
  struct
    datatype enum =
      NONE
    | AGAIN
    | INVAL
    | UNKNOWN
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | AGAIN => 1
          | INVAL => 2
          | UNKNOWN => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => AGAIN
          | 2 => INVAL
          | 3 => UNKNOWN
          | n => raise Value n
      )
    open Enum
  end
