signature GTK_MENU_SHELL_ACCESSIBLE_CLASS =
  sig
    type 'a menu_shell_accessible
    type 'a container_accessible_class
    include
      CLASS
        where type 'a class = 'a menu_shell_accessible container_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
