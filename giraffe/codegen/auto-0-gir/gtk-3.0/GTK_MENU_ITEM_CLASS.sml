signature GTK_MENU_ITEM_CLASS =
  sig
    type 'a menu_item
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a menu_item bin_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
