structure GtkRadioMenuItemAccessibleClass :>
  GTK_RADIO_MENU_ITEM_ACCESSIBLE_CLASS
    where type 'a check_menu_item_accessible_class = 'a GtkCheckMenuItemAccessibleClass.class
    where type C.notnull = GtkCheckMenuItemAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkCheckMenuItemAccessibleClass.C.p =
  struct
    type 'a check_menu_item_accessible_class = 'a GtkCheckMenuItemAccessibleClass.class
    open GtkCheckMenuItemAccessibleClass
    type 'a radio_menu_item_accessible = unit
    type 'a class = 'a radio_menu_item_accessible class
  end
