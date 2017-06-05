structure GIRepositoryScopeType :> G_I_REPOSITORY_SCOPE_TYPE =
  struct
    datatype enum =
      INVALID
    | CALL
    | ASYNC
    | NOTIFIED
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | CALL => 1
          | ASYNC => 2
          | NOTIFIED => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => CALL
          | 2 => ASYNC
          | 3 => NOTIFIED
          | n => raise Value n
      )
    open Enum
  end
