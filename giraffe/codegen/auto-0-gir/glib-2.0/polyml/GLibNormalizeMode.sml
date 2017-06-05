structure GLibNormalizeMode :> G_LIB_NORMALIZE_MODE =
  struct
    datatype enum =
      DEFAULT
    | NFD
    | DEFAULT_COMPOSE
    | NFC
    | ALL
    | NFKD
    | ALL_COMPOSE
    | NFKC
    structure Enum =
      Enum(
        type enum = enum
        val null = DEFAULT
        val toInt =
          fn
            DEFAULT => 0
          | NFD => 0
          | DEFAULT_COMPOSE => 1
          | NFC => 1
          | ALL => 2
          | NFKD => 2
          | ALL_COMPOSE => 3
          | NFKC => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => DEFAULT
          | 0 => NFD
          | 1 => DEFAULT_COMPOSE
          | 1 => NFC
          | 2 => ALL
          | 2 => NFKD
          | 3 => ALL_COMPOSE
          | 3 => NFKC
          | n => raise Value n
      )
    open Enum
  end
