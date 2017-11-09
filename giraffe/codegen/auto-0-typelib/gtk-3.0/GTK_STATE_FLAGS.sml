signature GTK_STATE_FLAGS =
  sig
    include FLAGS
    val NORMAL : t
    val ACTIVE : t
    val PRELIGHT : t
    val SELECTED : t
    val INSENSITIVE : t
    val INCONSISTENT : t
    val FOCUSED : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
