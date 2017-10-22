signature GIO_MENU_ITEM_CLASS =
  sig
    type 'a menu_item
    include
      CLASS
        where type 'a class = 'a menu_item GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
