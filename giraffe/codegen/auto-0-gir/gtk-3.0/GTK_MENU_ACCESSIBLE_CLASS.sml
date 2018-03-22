signature GTK_MENU_ACCESSIBLE_CLASS =
  sig
    type 'a menu_accessible
    type 'a menu_shell_accessible_class
    include
      CLASS
        where type 'a class = 'a menu_accessible menu_shell_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
