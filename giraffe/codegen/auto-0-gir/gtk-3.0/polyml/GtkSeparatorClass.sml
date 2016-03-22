structure GtkSeparatorClass :>
  GTK_SEPARATOR_CLASS
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a widget_class = 'a GtkWidgetClass.class
    open GtkWidgetClass
    type 'a separator = unit
    type 'a class = 'a separator class
  end
