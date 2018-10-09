signature GTK_CONTAINER_ACCESSIBLE_CLASS =
  sig
    type 'a container_accessible
    type 'a widget_accessible_class
    include
      CLASS
        where type 'a class = 'a container_accessible widget_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
