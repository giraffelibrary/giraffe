signature GTK_NOTEBOOK_CLASS =
  sig
    type 'a notebook
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a notebook container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
