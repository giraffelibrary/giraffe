signature GDK_WINDOW_EDGE =
  sig
    datatype enum =
      NORTH_WEST
    | NORTH
    | NORTH_EAST
    | WEST
    | EAST
    | SOUTH_WEST
    | SOUTH
    | SOUTH_EAST
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
