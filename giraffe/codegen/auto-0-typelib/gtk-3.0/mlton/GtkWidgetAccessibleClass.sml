structure GtkWidgetAccessibleClass :>
  GTK_WIDGET_ACCESSIBLE_CLASS
    where type 'a accessible_class = 'a GtkAccessibleClass.class
    where type C.notnull = GtkAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkAccessibleClass.C.p =
  struct
    type 'a accessible_class = 'a GtkAccessibleClass.class
    open GtkAccessibleClass
    type 'a widget_accessible = unit
    type 'a class = 'a widget_accessible class
  end
