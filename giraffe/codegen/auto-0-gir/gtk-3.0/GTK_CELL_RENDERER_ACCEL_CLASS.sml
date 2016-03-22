signature GTK_CELL_RENDERER_ACCEL_CLASS =
  sig
    type 'a cell_renderer_accel
    type 'a cell_renderer_text_class
    include
      CLASS
        where type 'a class = 'a cell_renderer_accel cell_renderer_text_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
