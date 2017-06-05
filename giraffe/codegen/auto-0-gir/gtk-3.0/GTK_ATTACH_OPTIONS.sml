signature GTK_ATTACH_OPTIONS =
  sig
    include FLAGS
    val EXPAND : t
    val SHRINK : t
    val FILL : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
