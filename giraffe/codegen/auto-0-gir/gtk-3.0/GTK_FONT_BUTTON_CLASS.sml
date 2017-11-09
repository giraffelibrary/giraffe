signature GTK_FONT_BUTTON_CLASS =
  sig
    type 'a font_button
    type 'a button_class
    include
      CLASS
        where type 'a class = 'a font_button button_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
