signature GTK_CHECK_BUTTON_CLASS =
  sig
    type 'a check_button
    type 'a toggle_button_class
    include
      CLASS
        where type 'a class = 'a check_button toggle_button_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
