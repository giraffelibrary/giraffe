structure GtkCellViewClass :>
  GTK_CELL_VIEW_CLASS
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a widget_class = 'a GtkWidgetClass.class
    open GtkWidgetClass
    type 'a cell_view = unit
    type 'a class = 'a cell_view class
  end
