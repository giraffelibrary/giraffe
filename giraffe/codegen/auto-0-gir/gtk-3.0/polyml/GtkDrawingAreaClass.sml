structure GtkDrawingAreaClass :>
  GTK_DRAWING_AREA_CLASS
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a drawing_area = unit
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a class = 'a drawing_area widget_class
    type t = base class
    fun toBase obj = obj
    val t = GtkWidgetClass.t
    val tOpt = GtkWidgetClass.tOpt
    structure C = GtkWidgetClass.C
  end
