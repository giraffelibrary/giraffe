signature GTK_CELL_EDITABLE_CLASS =
  sig
    type 'a cell_editable
    include
      CLASS
        where type 'a class = 'a cell_editable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
