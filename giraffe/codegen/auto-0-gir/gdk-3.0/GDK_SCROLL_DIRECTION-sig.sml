signature GDK_SCROLL_DIRECTION =
  sig
    datatype enum =
      UP
    | DOWN
    | LEFT
    | RIGHT
    | SMOOTH
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
