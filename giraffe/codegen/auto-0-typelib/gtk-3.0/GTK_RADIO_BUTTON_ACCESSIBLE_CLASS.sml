signature GTK_RADIO_BUTTON_ACCESSIBLE_CLASS =
  sig
    type 'a radio_button_accessible
    type 'a toggle_button_accessible_class
    include
      CLASS
        where type 'a class = 'a radio_button_accessible toggle_button_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
