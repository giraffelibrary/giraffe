structure GtkScrolledWindowAccessibleClass :>
  GTK_SCROLLED_WINDOW_ACCESSIBLE_CLASS
    where type 'a container_accessible_class = 'a GtkContainerAccessibleClass.class
    where type C.notnull = GtkContainerAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkContainerAccessibleClass.C.p =
  struct
    type 'a container_accessible_class = 'a GtkContainerAccessibleClass.class
    open GtkContainerAccessibleClass
    type 'a scrolled_window_accessible = unit
    type 'a class = 'a scrolled_window_accessible class
  end
