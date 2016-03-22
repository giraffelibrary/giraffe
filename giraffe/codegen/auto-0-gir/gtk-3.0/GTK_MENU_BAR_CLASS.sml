signature GTK_MENU_BAR_CLASS =
  sig
    type 'a menu_bar
    type 'a menu_shell_class
    include
      CLASS
        where type 'a class = 'a menu_bar menu_shell_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
