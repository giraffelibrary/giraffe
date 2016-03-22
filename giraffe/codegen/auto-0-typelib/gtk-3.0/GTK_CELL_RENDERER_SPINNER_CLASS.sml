signature GTK_CELL_RENDERER_SPINNER_CLASS =
  sig
    type 'a cell_renderer_spinner
    type 'a cell_renderer_class
    include
      CLASS
        where type 'a class = 'a cell_renderer_spinner cell_renderer_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
