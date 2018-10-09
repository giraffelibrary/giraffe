signature G_LIB_TRAVERSE_TYPE =
  sig
    datatype enum =
      IN_ORDER
    | PRE_ORDER
    | POST_ORDER
    | LEVEL_ORDER
    include
      ENUM
        where type t = enum
  end
