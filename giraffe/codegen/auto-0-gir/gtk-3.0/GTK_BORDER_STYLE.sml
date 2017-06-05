signature GTK_BORDER_STYLE =
  sig
    datatype enum =
      NONE
    | SOLID
    | INSET
    | OUTSET
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
