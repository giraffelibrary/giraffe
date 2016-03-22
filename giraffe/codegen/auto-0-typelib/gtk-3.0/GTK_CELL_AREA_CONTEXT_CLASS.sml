signature GTK_CELL_AREA_CONTEXT_CLASS =
  sig
    type 'a cell_area_context
    include
      CLASS
        where type 'a class = 'a cell_area_context GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
