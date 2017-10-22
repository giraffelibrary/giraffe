structure GtkStatusbarAccessibleClass :>
  GTK_STATUSBAR_ACCESSIBLE_CLASS
    where type 'a container_accessible_class = 'a GtkContainerAccessibleClass.class
    where type C.notnull = GtkContainerAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkContainerAccessibleClass.C.p =
  struct
    type 'a container_accessible_class = 'a GtkContainerAccessibleClass.class
    open GtkContainerAccessibleClass
    type 'a statusbar_accessible = unit
    type 'a class = 'a statusbar_accessible class
  end
