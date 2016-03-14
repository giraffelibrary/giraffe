signature PANGO_TAB_ARRAY_RECORD =
  sig
    include RECORD
    val t : (t, t) GObject.Value.accessor
    val tOpt : (t option, t option) GObject.Value.accessor
  end
