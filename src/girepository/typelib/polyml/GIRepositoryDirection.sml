structure GIRepositoryDirection :> G_I_REPOSITORY_DIRECTION =
  struct
    datatype enum =
      IN
    | OUT
    | INOUT
    structure Enum =
      Enum(
        type enum = enum
        val null = IN
        val toInt =
          fn
            IN => 0
          | OUT => 1
          | INOUT => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => IN
          | 1 => OUT
          | 2 => INOUT
          | n => raise Value n
      )
    open Enum
  end
