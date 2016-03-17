structure GtkCellRendererProgressClass :>
  GTK_CELL_RENDERER_PROGRESS_CLASS
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    where type C.notnull = GtkCellRendererClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererClass.C.p =
  struct
    type 'a cell_renderer_progress = unit
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type 'a class = 'a cell_renderer_progress cell_renderer_class
    type t = base class
    fun toBase obj = obj
    val t = GtkCellRendererClass.t
    val tOpt = GtkCellRendererClass.tOpt
    structure C = GtkCellRendererClass.C
  end
