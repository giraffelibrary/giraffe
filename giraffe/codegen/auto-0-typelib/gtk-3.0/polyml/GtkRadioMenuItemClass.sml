structure GtkRadioMenuItemClass :>
  GTK_RADIO_MENU_ITEM_CLASS
    where type 'a check_menu_item_class = 'a GtkCheckMenuItemClass.class
    where type C.notnull = GtkCheckMenuItemClass.C.notnull
    where type 'a C.p = 'a GtkCheckMenuItemClass.C.p =
  struct
    type 'a check_menu_item_class = 'a GtkCheckMenuItemClass.class
    open GtkCheckMenuItemClass
    type 'a radio_menu_item = unit
    type 'a class = 'a radio_menu_item class
  end
