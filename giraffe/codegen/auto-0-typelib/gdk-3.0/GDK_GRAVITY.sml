signature GDK_GRAVITY =
  sig
    datatype enum =
      NORTH_WEST
    | NORTH
    | NORTH_EAST
    | WEST
    | CENTER
    | EAST
    | SOUTH_WEST
    | SOUTH
    | SOUTH_EAST
    | STATIC
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
