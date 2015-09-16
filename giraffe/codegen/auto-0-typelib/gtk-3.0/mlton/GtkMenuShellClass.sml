structure GtkMenuShellClass :>
  GTK_MENU_SHELL_CLASS
    where type 'a container_class_t = 'a GtkContainerClass.t
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a menu_shell = unit
    type 'a container_class_t = 'a GtkContainerClass.t
    type 'a t = 'a menu_shell container_class_t
    fun toBase obj = obj
    val t = GtkContainerClass.t
    val tOpt = GtkContainerClass.tOpt
    structure C = GtkContainerClass.C
  end
