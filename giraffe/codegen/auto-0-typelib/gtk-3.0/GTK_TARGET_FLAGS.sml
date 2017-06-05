signature GTK_TARGET_FLAGS =
  sig
    include FLAGS
    val SAME_APP : t
    val SAME_WIDGET : t
    val OTHER_APP : t
    val OTHER_WIDGET : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
