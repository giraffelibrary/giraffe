structure GtkMenuBarClass :>
  GTK_MENU_BAR_CLASS
    where type 'a menu_shell_class = 'a GtkMenuShellClass.class
    where type C.notnull = GtkMenuShellClass.C.notnull
    where type 'a C.p = 'a GtkMenuShellClass.C.p =
  struct
    type 'a menu_shell_class = 'a GtkMenuShellClass.class
    open GtkMenuShellClass
    type 'a menu_bar = unit
    type 'a class = 'a menu_bar class
  end
