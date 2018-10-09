signature GTK_IMAGE_MENU_ITEM_CLASS =
  sig
    type 'a image_menu_item
    type 'a menu_item_class
    include
      CLASS
        where type 'a class = 'a image_menu_item menu_item_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
