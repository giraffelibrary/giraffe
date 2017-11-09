signature GTK_CONTAINER_CLASS =
  sig
    type 'a container
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a container widget_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
