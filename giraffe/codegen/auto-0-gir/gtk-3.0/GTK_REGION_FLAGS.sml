signature GTK_REGION_FLAGS =
  sig
    include FLAGS
    val EVEN : t
    val ODD : t
    val FIRST : t
    val LAST : t
    val SORTED : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
