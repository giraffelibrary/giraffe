structure GtkRecentChooserMenuClass :>
  GTK_RECENT_CHOOSER_MENU_CLASS
    where type 'a menu_class = 'a GtkMenuClass.class
    where type C.notnull = GtkMenuClass.C.notnull
    where type 'a C.p = 'a GtkMenuClass.C.p =
  struct
    type 'a menu_class = 'a GtkMenuClass.class
    open GtkMenuClass
    type 'a recent_chooser_menu = unit
    type 'a class = 'a recent_chooser_menu class
  end
