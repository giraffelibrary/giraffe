structure GtkCellRendererComboClass :>
  GTK_CELL_RENDERER_COMBO_CLASS
    where type 'a cell_renderer_text_class = 'a GtkCellRendererTextClass.class
    where type C.notnull = GtkCellRendererTextClass.C.notnull
    where type 'a C.p = 'a GtkCellRendererTextClass.C.p =
  struct
    type 'a cell_renderer_combo = unit
    type 'a cell_renderer_text_class = 'a GtkCellRendererTextClass.class
    type 'a class = 'a cell_renderer_combo cell_renderer_text_class
    type t = base class
    fun toBase obj = obj
    val t = GtkCellRendererTextClass.t
    val tOpt = GtkCellRendererTextClass.tOpt
    structure C = GtkCellRendererTextClass.C
  end
