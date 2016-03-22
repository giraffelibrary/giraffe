signature GTK_CELL_RENDERER_CLASS =
  sig
    type 'a cell_renderer
    include
      CLASS
        where type 'a class = 'a cell_renderer GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
