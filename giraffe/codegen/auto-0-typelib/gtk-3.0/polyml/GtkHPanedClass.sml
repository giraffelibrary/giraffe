structure GtkHPanedClass :>
  GTK_H_PANED_CLASS
    where type 'a paned_class = 'a GtkPanedClass.class
    where type C.notnull = GtkPanedClass.C.notnull
    where type 'a C.p = 'a GtkPanedClass.C.p =
  struct
    type 'a paned_class = 'a GtkPanedClass.class
    open GtkPanedClass
    type 'a h_paned = unit
    type 'a class = 'a h_paned class
  end
