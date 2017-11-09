signature GTK_CELL_RENDERER_SPIN_CLASS =
  sig
    type 'a cell_renderer_spin
    type 'a cell_renderer_text_class
    include
      CLASS
        where type 'a class = 'a cell_renderer_spin cell_renderer_text_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
