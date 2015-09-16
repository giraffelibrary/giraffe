structure GtkCellRendererToggleClass :>
  GTK_CELL_RENDERER_TOGGLE_CLASS
    where type 'a cell_renderer_class_t = 'a GtkCellRendererClass.t
    where type C.notnull = GtkCellRendererClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererClass.C.p =
  struct
    type 'a cell_renderer_toggle = unit
    type 'a cell_renderer_class_t = 'a GtkCellRendererClass.t
    type 'a t = 'a cell_renderer_toggle cell_renderer_class_t
    fun toBase obj = obj
    val t = GtkCellRendererClass.t
    val tOpt = GtkCellRendererClass.tOpt
    structure C = GtkCellRendererClass.C
  end
