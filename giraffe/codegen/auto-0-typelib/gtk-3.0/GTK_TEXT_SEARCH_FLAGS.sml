signature GTK_TEXT_SEARCH_FLAGS =
  sig
    include FLAGS
    val VISIBLE_ONLY : t
    val TEXT_ONLY : t
    val CASE_INSENSITIVE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
