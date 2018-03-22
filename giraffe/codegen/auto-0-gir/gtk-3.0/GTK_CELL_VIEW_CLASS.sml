signature GTK_CELL_VIEW_CLASS =
  sig
    type 'a cell_view
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a cell_view widget_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
