signature GTK_CORNER_TYPE =
  sig
    datatype enum =
      TOP_LEFT
    | BOTTOM_LEFT
    | TOP_RIGHT
    | BOTTOM_RIGHT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
