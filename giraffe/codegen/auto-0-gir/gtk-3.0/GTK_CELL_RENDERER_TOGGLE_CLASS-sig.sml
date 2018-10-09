signature GTK_CELL_RENDERER_TOGGLE_CLASS =
  sig
    type 'a cell_renderer_toggle
    type 'a cell_renderer_class
    include
      CLASS
        where type 'a class = 'a cell_renderer_toggle cell_renderer_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
