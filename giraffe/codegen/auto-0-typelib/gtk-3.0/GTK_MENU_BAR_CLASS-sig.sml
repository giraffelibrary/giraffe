signature GTK_MENU_BAR_CLASS =
  sig
    type 'a menu_bar
    type 'a menu_shell_class
    include
      CLASS
        where type 'a class = 'a menu_bar menu_shell_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
