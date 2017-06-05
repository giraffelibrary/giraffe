signature GTK_JUNCTION_SIDES =
  sig
    include FLAGS
    val NONE : t
    val CORNER_TOPLEFT : t
    val CORNER_TOPRIGHT : t
    val CORNER_BOTTOMLEFT : t
    val CORNER_BOTTOMRIGHT : t
    val TOP : t
    val BOTTOM : t
    val LEFT : t
    val RIGHT : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
