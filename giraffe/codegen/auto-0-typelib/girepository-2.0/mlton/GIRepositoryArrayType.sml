structure GIRepositoryArrayType :> G_I_REPOSITORY_ARRAY_TYPE =
  struct
    datatype enum =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
    structure Enum =
      Enum(
        type enum = enum
        val null = C
        val toInt =
          fn
            C => 0
          | ARRAY => 1
          | PTR_ARRAY => 2
          | BYTE_ARRAY => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => C
          | 1 => ARRAY
          | 2 => PTR_ARRAY
          | 3 => BYTE_ARRAY
          | n => raise Value n
      )
    open Enum
  end
