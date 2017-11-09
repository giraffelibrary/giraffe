signature GTK_FONT_CHOOSER_CLASS =
  sig
    type 'a font_chooser
    include
      CLASS
        where type 'a class = 'a font_chooser GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
