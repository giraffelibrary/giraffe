signature ATK_COORD_TYPE =
  sig
    datatype enum =
      SCREEN
    | WINDOW
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
