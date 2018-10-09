signature GTK_WIDGET_ACCESSIBLE_CLASS =
  sig
    type 'a widget_accessible
    type 'a accessible_class
    include
      CLASS
        where type 'a class = 'a widget_accessible accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
