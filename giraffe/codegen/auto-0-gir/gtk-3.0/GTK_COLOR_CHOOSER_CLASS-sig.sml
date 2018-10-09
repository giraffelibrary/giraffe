signature GTK_COLOR_CHOOSER_CLASS =
  sig
    type 'a color_chooser
    include
      CLASS
        where type 'a class = 'a color_chooser GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
