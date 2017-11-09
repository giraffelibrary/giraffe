signature GTK_CELL_EDITABLE_CLASS =
  sig
    type 'a cell_editable
    include
      CLASS
        where type 'a class = 'a cell_editable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
