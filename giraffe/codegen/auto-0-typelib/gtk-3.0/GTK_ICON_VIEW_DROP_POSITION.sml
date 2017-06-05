signature GTK_ICON_VIEW_DROP_POSITION =
  sig
    datatype enum =
      NO_DROP
    | DROP_INTO
    | DROP_LEFT
    | DROP_RIGHT
    | DROP_ABOVE
    | DROP_BELOW
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
