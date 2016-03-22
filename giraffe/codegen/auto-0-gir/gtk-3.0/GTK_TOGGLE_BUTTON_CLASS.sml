signature GTK_TOGGLE_BUTTON_CLASS =
  sig
    type 'a toggle_button
    type 'a button_class
    include
      CLASS
        where type 'a class = 'a toggle_button button_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
