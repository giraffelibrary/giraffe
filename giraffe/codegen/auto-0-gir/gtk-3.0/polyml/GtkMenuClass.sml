structure GtkMenuClass :>
  GTK_MENU_CLASS
    where type 'a menu_shell_class = 'a GtkMenuShellClass.class
    where type C.notnull = GtkMenuShellClass.C.notnull
    where type 'a C.p = 'a GtkMenuShellClass.C.p =
  struct
    type 'a menu = unit
    type 'a menu_shell_class = 'a GtkMenuShellClass.class
    type 'a class = 'a menu menu_shell_class
    type t = base class
    fun toBase obj = obj
    val t = GtkMenuShellClass.t
    val tOpt = GtkMenuShellClass.tOpt
    structure C = GtkMenuShellClass.C
  end
