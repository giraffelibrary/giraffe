signature GTK_SEPARATOR_MENU_ITEM_CLASS =
  sig
    type 'a separator_menu_item
    type 'a menu_item_class
    include
      CLASS
        where type 'a class = 'a separator_menu_item menu_item_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
