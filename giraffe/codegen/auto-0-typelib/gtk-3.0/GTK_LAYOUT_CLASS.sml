signature GTK_LAYOUT_CLASS =
  sig
    type 'a layout
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a layout container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
