structure GtkCellRendererComboClass :>
  GTK_CELL_RENDERER_COMBO_CLASS
    where type 'a cell_renderer_text_class_t = 'a GtkCellRendererTextClass.t
    where type C.notnull = GtkCellRendererTextClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererTextClass.C.p =
  struct
    type 'a cell_renderer_combo = unit
    type 'a cell_renderer_text_class_t = 'a GtkCellRendererTextClass.t
    type 'a t = 'a cell_renderer_combo cell_renderer_text_class_t
    fun toBase obj = obj
    val t = GtkCellRendererTextClass.t
    val tOpt = GtkCellRendererTextClass.tOpt
    structure C = GtkCellRendererTextClass.C
  end
