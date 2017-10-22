signature GTK_MENU_BUTTON_ACCESSIBLE_CLASS =
  sig
    type 'a menu_button_accessible
    type 'a toggle_button_accessible_class
    include
      CLASS
        where type 'a class = 'a menu_button_accessible toggle_button_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
