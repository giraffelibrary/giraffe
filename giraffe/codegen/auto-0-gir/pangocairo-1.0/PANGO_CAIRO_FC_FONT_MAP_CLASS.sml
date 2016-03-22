signature PANGO_CAIRO_FC_FONT_MAP_CLASS =
  sig
    type 'a fc_font_map
    include
      CLASS
        where type 'a class = 'a fc_font_map Pango.FontMapClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
