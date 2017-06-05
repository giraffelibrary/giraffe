signature GTK_BUTTON_BOX_STYLE =
  sig
    datatype enum =
      SPREAD
    | EDGE
    | START
    | END
    | CENTER
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
