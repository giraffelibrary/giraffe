signature GTK_RADIO_MENU_ITEM_CLASS =
  sig
    type 'a radio_menu_item
    type 'a check_menu_item_class
    include
      CLASS
        where type 'a class = 'a radio_menu_item check_menu_item_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
