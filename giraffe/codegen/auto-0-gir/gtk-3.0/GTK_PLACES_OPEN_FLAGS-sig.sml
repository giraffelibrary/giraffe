signature GTK_PLACES_OPEN_FLAGS =
  sig
    include FLAGS
    val NORMAL : t
    val NEW_TAB : t
    val NEW_WINDOW : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
