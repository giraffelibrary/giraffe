signature GTK_COLOR_BUTTON_CLASS =
  sig
    type 'a color_button
    type 'a button_class
    include
      CLASS
        where type 'a class = 'a color_button button_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
