signature GTK_ICON_VIEW_ACCESSIBLE_CLASS =
  sig
    type 'a icon_view_accessible
    type 'a container_accessible_class
    include
      CLASS
        where type 'a class = 'a icon_view_accessible container_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
