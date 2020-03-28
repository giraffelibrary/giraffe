signature GTK_DIRECTION_TYPE =
  sig
    datatype enum =
      TAB_FORWARD
    | TAB_BACKWARD
    | UP
    | DOWN
    | LEFT
    | RIGHT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end