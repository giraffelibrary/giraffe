signature GTK_CELL_RENDERER_STATE =
  sig
    include FLAGS
    val SELECTED : t
    val PRELIT : t
    val INSENSITIVE : t
    val SORTED : t
    val FOCUSED : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
