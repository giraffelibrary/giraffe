signature G_LIB_NORMALIZE_MODE =
  sig
    datatype enum =
      DEFAULT
    | NFD
    | DEFAULT_COMPOSE
    | NFC
    | ALL
    | NFKD
    | ALL_COMPOSE
    | NFKC
    include
      ENUM
        where type t = enum
  end
