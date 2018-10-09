signature GTK_POPOVER_MENU_CLASS =
  sig
    type 'a popover_menu
    type 'a popover_class
    include
      CLASS
        where type 'a class = 'a popover_menu popover_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
