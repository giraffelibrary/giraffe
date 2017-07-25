structure GLibNormalizeMode :> G_LIB_NORMALIZE_MODE =
  struct
    datatype enum =
      DEFAULT
    | DEFAULT_COMPOSE
    | ALL
    | ALL_COMPOSE
    structure Enum =
      Enum(
        type enum = enum
        val null = DEFAULT
        val toInt =
          fn
            DEFAULT => 0
          | DEFAULT_COMPOSE => 1
          | ALL => 2
          | ALL_COMPOSE => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => DEFAULT
          | 1 => DEFAULT_COMPOSE
          | 2 => ALL
          | 3 => ALL_COMPOSE
          | n => raise Value n
      )
    open Enum
  end
