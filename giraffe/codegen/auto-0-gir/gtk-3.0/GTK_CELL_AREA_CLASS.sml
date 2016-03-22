signature GTK_CELL_AREA_CLASS =
  sig
    type 'a cell_area
    include
      CLASS
        where type 'a class = 'a cell_area GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
