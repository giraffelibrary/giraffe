signature GDK_RGBA_RECORD =
  sig
    include VALUE_RECORD
    val t : (t, t) GObject.Value.accessor
    val tOpt : (t option, t option) GObject.Value.accessor
  end
