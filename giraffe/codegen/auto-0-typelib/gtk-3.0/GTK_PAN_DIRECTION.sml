signature GTK_PAN_DIRECTION =
  sig
    datatype enum =
      LEFT
    | RIGHT
    | UP
    | DOWN
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
