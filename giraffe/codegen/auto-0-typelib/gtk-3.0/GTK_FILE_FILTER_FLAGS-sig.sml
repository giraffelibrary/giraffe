signature GTK_FILE_FILTER_FLAGS =
  sig
    include FLAGS
    val FILENAME : t
    val URI : t
    val DISPLAY_NAME : t
    val MIME_TYPE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
