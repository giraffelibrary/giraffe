signature PANGO_FONT_MASK =
  sig
    include FLAGS
    val FAMILY : t
    val STYLE : t
    val VARIANT : t
    val WEIGHT : t
    val STRETCH : t
    val SIZE : t
    val GRAVITY : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
