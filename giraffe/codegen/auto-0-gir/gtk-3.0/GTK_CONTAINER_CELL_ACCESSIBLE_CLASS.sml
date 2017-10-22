signature GTK_CONTAINER_CELL_ACCESSIBLE_CLASS =
  sig
    type 'a container_cell_accessible
    type 'a cell_accessible_class
    include
      CLASS
        where type 'a class = 'a container_cell_accessible cell_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
