signature GTK_SOURCE_GUTTER_RENDERER_STATE =
  sig
    include FLAGS
    val NORMAL : t
    val CURSOR : t
    val PRELIT : t
    val SELECTED : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
