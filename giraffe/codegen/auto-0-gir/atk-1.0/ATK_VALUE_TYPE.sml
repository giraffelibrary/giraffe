signature ATK_VALUE_TYPE =
  sig
    datatype enum =
      VERY_WEAK
    | WEAK
    | ACCEPTABLE
    | STRONG
    | VERY_STRONG
    | VERY_LOW
    | LOW
    | MEDIUM
    | HIGH
    | VERY_HIGH
    | VERY_BAD
    | BAD
    | GOOD
    | VERY_GOOD
    | BEST
    | LAST_DEFINED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
    val getLocalizedName : t -> string
    val getName : t -> string
  end
