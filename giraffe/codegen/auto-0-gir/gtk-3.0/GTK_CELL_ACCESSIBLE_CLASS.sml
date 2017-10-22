signature GTK_CELL_ACCESSIBLE_CLASS =
  sig
    type 'a cell_accessible
    type 'a accessible_class
    include
      CLASS
        where type 'a class = 'a cell_accessible accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
