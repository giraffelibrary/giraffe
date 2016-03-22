signature PANGO_CAIRO_FONT_MAP_CLASS =
  sig
    type 'a font_map
    include
      CLASS
        where type 'a class = 'a font_map GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
