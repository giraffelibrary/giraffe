signature GTK_RECENT_FILTER_FLAGS =
  sig
    include FLAGS
    val URI : t
    val DISPLAY_NAME : t
    val MIME_TYPE : t
    val APPLICATION : t
    val GROUP : t
    val AGE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
