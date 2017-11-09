signature GTK_TOGGLE_BUTTON_CLASS =
  sig
    type 'a toggle_button
    type 'a button_class
    include
      CLASS
        where type 'a class = 'a toggle_button button_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
