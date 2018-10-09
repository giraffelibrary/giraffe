signature GIO_MENU_LINK_ITER_CLASS =
  sig
    type 'a menu_link_iter
    include
      CLASS
        where type 'a class = 'a menu_link_iter GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
