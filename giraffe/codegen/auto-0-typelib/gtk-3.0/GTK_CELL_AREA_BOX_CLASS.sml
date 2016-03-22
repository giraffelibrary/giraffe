signature GTK_CELL_AREA_BOX_CLASS =
  sig
    type 'a cell_area_box
    type 'a cell_area_class
    include
      CLASS
        where type 'a class = 'a cell_area_box cell_area_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
