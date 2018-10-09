signature GTK_CELL_RENDERER_STATE =
  sig
    include FLAGS
    val SELECTED : t
    val PRELIT : t
    val INSENSITIVE : t
    val SORTED : t
    val FOCUSED : t
    val EXPANDABLE : t
    val EXPANDED : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
