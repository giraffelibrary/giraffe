structure GtkRecentChooserMenuClass :>
  GTK_RECENT_CHOOSER_MENU_CLASS
    where type 'a menu_class = 'a GtkMenuClass.class
    where type C.notnull = GtkMenuClass.C.notnull
    where type 'a C.p = 'a GtkMenuClass.C.p =
  struct
    type 'a recent_chooser_menu = unit
    type 'a menu_class = 'a GtkMenuClass.class
    type 'a class = 'a recent_chooser_menu menu_class
    type t = base class
    fun toBase obj = obj
    val t = GtkMenuClass.t
    val tOpt = GtkMenuClass.tOpt
    structure C = GtkMenuClass.C
  end
