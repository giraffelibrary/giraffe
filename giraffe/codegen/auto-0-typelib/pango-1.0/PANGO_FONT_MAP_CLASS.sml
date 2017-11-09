signature PANGO_FONT_MAP_CLASS =
  sig
    type 'a font_map
    include
      CLASS
        where type 'a class = 'a font_map GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
