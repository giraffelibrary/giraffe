signature GTK_RADIO_MENU_ITEM_ACCESSIBLE_CLASS =
  sig
    type 'a radio_menu_item_accessible
    type 'a check_menu_item_accessible_class
    include
      CLASS
        where type 'a class = 'a radio_menu_item_accessible check_menu_item_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
