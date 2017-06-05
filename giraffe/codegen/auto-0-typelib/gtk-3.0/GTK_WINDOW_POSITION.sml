signature GTK_WINDOW_POSITION =
  sig
    datatype enum =
      NONE
    | CENTER
    | MOUSE
    | CENTER_ALWAYS
    | CENTER_ON_PARENT
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
