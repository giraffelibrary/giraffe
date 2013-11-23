structure GtkCellRendererSpinnerClass :>
  GTK_CELL_RENDERER_SPINNER_CLASS
    where type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    where type C.notnull = GtkCellRendererClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererClass.C.p =
  struct
    type 'a cellrendererspinner = unit
    type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    type 'a t = 'a cellrendererspinner cellrendererclass_t
    fun toBase obj = obj
    val t = GtkCellRendererClass.t
    val tOpt = GtkCellRendererClass.tOpt
    structure C = GtkCellRendererClass.C
  end
