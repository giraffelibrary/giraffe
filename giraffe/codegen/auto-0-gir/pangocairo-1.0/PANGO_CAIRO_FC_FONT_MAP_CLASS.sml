signature PANGO_CAIRO_FC_FONT_MAP_CLASS =
  sig
    type 'a fc_font_map
    include
      CLASS
        where type 'a class = 'a fc_font_map Pango.FontMapClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
