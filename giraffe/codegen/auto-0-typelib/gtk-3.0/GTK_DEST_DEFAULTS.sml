signature GTK_DEST_DEFAULTS =
  sig
    include FLAGS
    val MOTION : t
    val HIGHLIGHT : t
    val DROP : t
    val ALL : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
