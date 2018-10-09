signature GTK_SOURCE_SORT_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val CASE_SENSITIVE : t
    val REVERSE_ORDER : t
    val REMOVE_DUPLICATES : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
