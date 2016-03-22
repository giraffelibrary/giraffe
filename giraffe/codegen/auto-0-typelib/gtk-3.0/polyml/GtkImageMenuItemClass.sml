structure GtkImageMenuItemClass :>
  GTK_IMAGE_MENU_ITEM_CLASS
    where type 'a menu_item_class = 'a GtkMenuItemClass.class
    where type C.notnull = GtkMenuItemClass.C.notnull
    where type 'a C.p = 'a GtkMenuItemClass.C.p =
  struct
    type 'a menu_item_class = 'a GtkMenuItemClass.class
    open GtkMenuItemClass
    type 'a image_menu_item = unit
    type 'a class = 'a image_menu_item class
  end
