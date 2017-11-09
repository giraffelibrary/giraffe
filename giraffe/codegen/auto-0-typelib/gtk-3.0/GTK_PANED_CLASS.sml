signature GTK_PANED_CLASS =
  sig
    type 'a paned
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a paned container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
