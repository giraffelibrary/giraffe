signature PANGO_FONT_CLASS =
  sig
    type 'a font
    include
      CLASS
        where type 'a class = 'a font GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
