structure GtkCheckMenuItemAccessibleClass :>
  GTK_CHECK_MENU_ITEM_ACCESSIBLE_CLASS
    where type 'a menu_item_accessible_class = 'a GtkMenuItemAccessibleClass.class
    where type C.notnull = GtkMenuItemAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkMenuItemAccessibleClass.C.p =
  struct
    type 'a menu_item_accessible_class = 'a GtkMenuItemAccessibleClass.class
    open GtkMenuItemAccessibleClass
    type 'a check_menu_item_accessible = unit
    type 'a class = 'a check_menu_item_accessible class
  end
