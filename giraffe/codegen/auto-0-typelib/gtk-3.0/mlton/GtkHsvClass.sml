structure GtkHsvClass :>
  GTK_HSV_CLASS
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a widget_class = 'a GtkWidgetClass.class
    open GtkWidgetClass
    type 'a hsv = unit
    type 'a class = 'a hsv class
  end
