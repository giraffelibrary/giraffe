signature GTK_MENU_SHELL_CLASS =
  sig
    type 'a menu_shell
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a menu_shell container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
