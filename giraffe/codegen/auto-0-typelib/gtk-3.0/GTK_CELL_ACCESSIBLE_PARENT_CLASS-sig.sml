signature GTK_CELL_ACCESSIBLE_PARENT_CLASS =
  sig
    type 'a cell_accessible_parent
    include
      CLASS
        where type 'a class = 'a cell_accessible_parent GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
