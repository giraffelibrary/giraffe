signature GTK_RADIO_BUTTON_CLASS =
  sig
    type 'a radio_button
    type 'a check_button_class
    include
      CLASS
        where type 'a class = 'a radio_button check_button_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
