signature GTK_COLOR_CHOOSER_WIDGET_CLASS =
  sig
    type 'a color_chooser_widget
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a color_chooser_widget box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
