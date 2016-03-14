signature GTK_RECENT_FILTER_INFO_RECORD =
  sig
    include NEW_RECORD
    val t : (t, t) GObject.Value.accessor
    val tOpt : (t option, t option) GObject.Value.accessor
  end
