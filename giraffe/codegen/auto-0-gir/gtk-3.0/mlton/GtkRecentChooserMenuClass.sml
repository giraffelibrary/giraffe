structure GtkRecentChooserMenuClass :>
  GTK_RECENT_CHOOSER_MENU_CLASS
    where type 'a menu_class_t = 'a GtkMenuClass.t
    where type C.notnull = GtkMenuClass.C.notnull
    where type 'a C.p = 'a GtkMenuClass.C.p =
  struct
    type 'a recent_chooser_menu = unit
    type 'a menu_class_t = 'a GtkMenuClass.t
    type 'a t = 'a recent_chooser_menu menu_class_t
    fun toBase obj = obj
    val t = GtkMenuClass.t
    val tOpt = GtkMenuClass.tOpt
    structure C = GtkMenuClass.C
  end
