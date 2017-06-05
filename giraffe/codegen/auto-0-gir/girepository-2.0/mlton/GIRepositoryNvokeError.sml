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
        exception Value of GInt.t
        val fromInt =
          fn
            0 => FAILED
          | 1 => SYMBOL_NOT_FOUND
          | 2 => ARGUMENT_MISMATCH
          | n => raise Value n
      )
    open Enum
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-invoke-error-quark",
          FFI.fromVal,
          Error
        )
  end
exception GIRepositoryNvokeError = GIRepositoryNvokeError.Error
