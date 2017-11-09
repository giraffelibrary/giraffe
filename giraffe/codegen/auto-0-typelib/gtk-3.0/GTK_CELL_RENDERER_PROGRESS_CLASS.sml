signature GTK_CELL_RENDERER_PROGRESS_CLASS =
  sig
    type 'a cell_renderer_progress
    type 'a cell_renderer_class
    include
      CLASS
        where type 'a class = 'a cell_renderer_progress cell_renderer_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
