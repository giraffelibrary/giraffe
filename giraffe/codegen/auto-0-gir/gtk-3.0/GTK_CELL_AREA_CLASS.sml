signature GTK_CELL_AREA_CLASS =
  sig
    type 'a cell_area
    include
      CLASS
        where type 'a class = 'a cell_area GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
