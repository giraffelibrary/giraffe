structure GLibTraverseType :> G_LIB_TRAVERSE_TYPE =
  struct
    datatype enum =
      IN_ORDER
    | PRE_ORDER
    | POST_ORDER
    | LEVEL_ORDER
    structure Enum =
      Enum(
        type enum = enum
        val null = IN_ORDER
        val toInt =
          fn
            IN_ORDER => 0
          | PRE_ORDER => 1
          | POST_ORDER => 2
          | LEVEL_ORDER => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => IN_ORDER
          | 1 => PRE_ORDER
          | 2 => POST_ORDER
          | 3 => LEVEL_ORDER
          | n => raise Value n
      )
    open Enum
  end
