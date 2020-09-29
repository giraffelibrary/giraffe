structure GIRepositoryTransfer :> G_I_REPOSITORY_TRANSFER =
  struct
    datatype enum =
      NOTHING
    | CONTAINER
    | EVERYTHING
    structure Enum =
      Enum(
        type enum = enum
        val null = NOTHING
        val toInt =
          fn
            NOTHING => 0
          | CONTAINER => 1
          | EVERYTHING => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NOTHING
          | 1 => CONTAINER
          | 2 => EVERYTHING
          | n => raise Value n
      )
    open Enum
  end
