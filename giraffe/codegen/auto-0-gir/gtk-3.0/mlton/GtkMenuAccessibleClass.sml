structure GtkMenuAccessibleClass :>
  GTK_MENU_ACCESSIBLE_CLASS
    where type 'a menu_shell_accessible_class = 'a GtkMenuShellAccessibleClass.class
    where type C.notnull = GtkMenuShellAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkMenuShellAccessibleClass.C.p =
  struct
    type 'a menu_shell_accessible_class = 'a GtkMenuShellAccessibleClass.class
    open GtkMenuShellAccessibleClass
    type 'a menu_accessible = unit
    type 'a class = 'a menu_accessible class
  end
