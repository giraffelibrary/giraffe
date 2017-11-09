signature GTK_TOOLBAR_CLASS =
  sig
    type 'a toolbar
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a toolbar container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
