signature GTK_CELL_LAYOUT_CLASS =
  sig
    type 'a cell_layout
    include
      CLASS
        where type 'a class = 'a cell_layout GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
