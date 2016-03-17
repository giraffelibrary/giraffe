structure GtkRadioMenuItemClass :>
  GTK_RADIO_MENU_ITEM_CLASS
    where type 'a check_menu_item_class = 'a GtkCheckMenuItemClass.class
    where type C.notnull = GtkCheckMenuItemClass.C.notnull
    where type 'a C.p = 'a GtkCheckMenuItemClass.C.p =
  struct
    type 'a radio_menu_item = unit
    type 'a check_menu_item_class = 'a GtkCheckMenuItemClass.class
    type 'a class = 'a radio_menu_item check_menu_item_class
    type t = base class
    fun toBase obj = obj
    val t = GtkCheckMenuItemClass.t
    val tOpt = GtkCheckMenuItemClass.tOpt
    structure C = GtkCheckMenuItemClass.C
  end
