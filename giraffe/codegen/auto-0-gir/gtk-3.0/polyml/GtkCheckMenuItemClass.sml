structure GtkCheckMenuItemClass :>
  GTK_CHECK_MENU_ITEM_CLASS
    where type 'a menu_item_class_t = 'a GtkMenuItemClass.t
    where type C.notnull = GtkMenuItemClass.C.notnull
    where type 'a C.p = 'a GtkMenuItemClass.C.p =
  struct
    type 'a check_menu_item = unit
    type 'a menu_item_class_t = 'a GtkMenuItemClass.t
    type 'a t = 'a check_menu_item menu_item_class_t
    fun toBase obj = obj
    val t = GtkMenuItemClass.t
    val tOpt = GtkMenuItemClass.tOpt
    structure C = GtkMenuItemClass.C
  end
