signature GTK_POPOVER_ACCESSIBLE_CLASS =
  sig
    type 'a popover_accessible
    type 'a container_accessible_class
    include
      CLASS
        where type 'a class = 'a popover_accessible container_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
