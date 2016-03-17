structure GtkCellViewClass :>
  GTK_CELL_VIEW_CLASS
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a cell_view = unit
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a class = 'a cell_view widget_class
    type t = base class
    fun toBase obj = obj
    val t = GtkWidgetClass.t
    val tOpt = GtkWidgetClass.tOpt
    structure C = GtkWidgetClass.C
  end
