signature GTK_BUTTON_BOX_STYLE =
  sig
    datatype enum =
      SPREAD
    | EDGE
    | START
    | END
    | CENTER
    | EXPAND
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
