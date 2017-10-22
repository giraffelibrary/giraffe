structure GtkContainerAccessibleClass :>
  GTK_CONTAINER_ACCESSIBLE_CLASS
    where type 'a widget_accessible_class = 'a GtkWidgetAccessibleClass.class
    where type C.notnull = GtkWidgetAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkWidgetAccessibleClass.C.p =
  struct
    type 'a widget_accessible_class = 'a GtkWidgetAccessibleClass.class
    open GtkWidgetAccessibleClass
    type 'a container_accessible = unit
    type 'a class = 'a container_accessible class
  end
