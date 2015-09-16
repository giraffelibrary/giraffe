structure GtkMenuItemClass :>
  GTK_MENU_ITEM_CLASS
    where type 'a bin_class_t = 'a GtkBinClass.t
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a menu_item = unit
    type 'a bin_class_t = 'a GtkBinClass.t
    type 'a t = 'a menu_item bin_class_t
    fun toBase obj = obj
    val t = GtkBinClass.t
    val tOpt = GtkBinClass.tOpt
    structure C = GtkBinClass.C
  end
