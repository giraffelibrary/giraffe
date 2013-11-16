structure GtkCellRendererAccelClass :>
  GTK_CELL_RENDERER_ACCEL_CLASS
    where type 'a cellrenderertextclass_t = 'a GtkCellRendererTextClass.t
    where type C.notnull = GtkCellRendererTextClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererTextClass.C.p =
  struct
    type 'a cellrendereraccel = unit
    type 'a cellrenderertextclass_t = 'a GtkCellRendererTextClass.t
    type 'a t = 'a cellrendereraccel cellrenderertextclass_t
    fun toBase obj = obj
    val t = GtkCellRendererTextClass.t
    val tOpt = GtkCellRendererTextClass.tOpt
    structure C = GtkCellRendererTextClass.C
  end
