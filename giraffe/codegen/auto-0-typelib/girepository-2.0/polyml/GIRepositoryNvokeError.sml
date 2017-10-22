structure GIRepositoryNvokeError :> G_I_REPOSITORY_NVOKE_ERROR =
  struct
    datatype enum =
      FAILED
    | SYMBOL_NOT_FOUND
    | ARGUMENT_MISMATCH
    structure Enum =
      Enum(
        type enum = enum
        val null = FAILED
        val toInt =
          fn
            FAILED => 0
          | SYMBOL_NOT_FOUND => 1
          | ARGUMENT_MISMATCH => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => FAILED
          | 1 => SYMBOL_NOT_FOUND
          | 2 => ARGUMENT_MISMATCH
          | n => raise Value n
      )
    open Enum
  end
