signature G_LIB_NORMALIZE_MODE =
  sig
    datatype enum =
      DEFAULT
    | DEFAULT_COMPOSE
    | ALL
    | ALL_COMPOSE
    include
      ENUM
        where type t = enum
  end
