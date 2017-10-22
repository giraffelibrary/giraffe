structure GtkHeaderBarClass :>
  GTK_HEADER_BAR_CLASS
    where type 'a container_class = 'a GtkContainerClass.class
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a container_class = 'a GtkContainerClass.class
    open GtkContainerClass
    type 'a header_bar = unit
    type 'a class = 'a header_bar class
  end
