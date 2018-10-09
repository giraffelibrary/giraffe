signature GTK_CELL_RENDERER_CLASS =
  sig
    type 'a cell_renderer
    include
      CLASS
        where type 'a class = 'a cell_renderer GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
