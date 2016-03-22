structure GtkLabelClass :>
  GTK_LABEL_CLASS
    where type 'a misc_class = 'a GtkMiscClass.class
    where type C.notnull = GtkMiscClass.C.notnull
    where type 'a C.p = 'a GtkMiscClass.C.p =
  struct
    type 'a misc_class = 'a GtkMiscClass.class
    open GtkMiscClass
    type 'a label = unit
    type 'a class = 'a label class
  end
