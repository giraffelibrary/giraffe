signature GTK_CHECK_MENU_ITEM_ACCESSIBLE_CLASS =
  sig
    type 'a check_menu_item_accessible
    type 'a menu_item_accessible_class
    include
      CLASS
        where type 'a class = 'a check_menu_item_accessible menu_item_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
