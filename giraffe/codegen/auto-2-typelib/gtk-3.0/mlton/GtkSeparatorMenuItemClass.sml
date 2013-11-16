structure GtkSeparatorMenuItemClass :>
  GTK_SEPARATOR_MENU_ITEM_CLASS
    where type 'a menuitemclass_t = 'a GtkMenuItemClass.t
    where type C.notnull = GtkMenuItemClass.C.notnull
    where type 'a C.p = 'a GtkMenuItemClass.C.p =
  struct
    type 'a separatormenuitem = unit
    type 'a menuitemclass_t = 'a GtkMenuItemClass.t
    type 'a t = 'a separatormenuitem menuitemclass_t
    fun toBase obj = obj
    val t = GtkMenuItemClass.t
    val tOpt = GtkMenuItemClass.tOpt
    structure C = GtkMenuItemClass.C
  end
