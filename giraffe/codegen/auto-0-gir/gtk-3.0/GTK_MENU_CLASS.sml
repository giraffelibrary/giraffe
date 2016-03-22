signature GTK_MENU_CLASS =
  sig
    type 'a menu
    type 'a menu_shell_class
    include
      CLASS
        where type 'a class = 'a menu menu_shell_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
