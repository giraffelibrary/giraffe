structure GtkCellRendererComboClass :>
  GTK_CELL_RENDERER_COMBO_CLASS
    where type 'a cellrenderertextclass_t = 'a GtkCellRendererTextClass.t
    where type C.notnull = GtkCellRendererTextClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererTextClass.C.p =
  struct
    type 'a cellrenderercombo = unit
    type 'a cellrenderertextclass_t = 'a GtkCellRendererTextClass.t
    type 'a t = 'a cellrenderercombo cellrenderertextclass_t
    fun toBase obj = obj
    val t = GtkCellRendererTextClass.t
    val tOpt = GtkCellRendererTextClass.tOpt
    structure C = GtkCellRendererTextClass.C
  end
