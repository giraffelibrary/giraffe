signature GTK_POSITION_TYPE =
  sig
    datatype enum =
      LEFT
    | RIGHT
    | TOP
    | BOTTOM
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
