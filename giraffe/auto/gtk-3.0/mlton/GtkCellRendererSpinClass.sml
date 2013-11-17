structure GtkCellRendererSpinClass :>
  GTK_CELL_RENDERER_SPIN_CLASS
    where type 'a cellrenderertextclass_t = 'a GtkCellRendererTextClass.t
    where type C.notnull = GtkCellRendererTextClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererTextClass.C.p =
  struct
    type 'a cellrendererspin = unit
    type 'a cellrenderertextclass_t = 'a GtkCellRendererTextClass.t
    type 'a t = 'a cellrendererspin cellrenderertextclass_t
    fun toBase obj = obj
    val t = GtkCellRendererTextClass.t
    val tOpt = GtkCellRendererTextClass.tOpt
    structure C = GtkCellRendererTextClass.C
  end
