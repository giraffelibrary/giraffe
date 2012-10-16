structure GtkCellRendererTextClass :>
  GTK_CELL_RENDERER_TEXT_CLASS
    where type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    where type C.notnull = GtkCellRendererClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererClass.C.p =
  struct
    type 'a cellrenderertext = unit
    type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    type 'a t = 'a cellrenderertext cellrendererclass_t
    fun toBase obj = obj
    val t = GtkCellRendererClass.t
    val tOpt = GtkCellRendererClass.tOpt
    structure C = GtkCellRendererClass.C
  end
