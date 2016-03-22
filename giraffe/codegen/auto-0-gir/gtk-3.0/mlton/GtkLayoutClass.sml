structure GtkLayoutClass :>
  GTK_LAYOUT_CLASS
    where type 'a container_class = 'a GtkContainerClass.class
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a container_class = 'a GtkContainerClass.class
    open GtkContainerClass
    type 'a layout = unit
    type 'a class = 'a layout class
  end
