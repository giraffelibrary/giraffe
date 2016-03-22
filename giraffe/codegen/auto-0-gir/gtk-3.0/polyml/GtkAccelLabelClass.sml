structure GtkAccelLabelClass :>
  GTK_ACCEL_LABEL_CLASS
    where type 'a label_class = 'a GtkLabelClass.class
    where type C.notnull = GtkLabelClass.C.notnull
    where type 'a C.p = 'a GtkLabelClass.C.p =
  struct
    type 'a label_class = 'a GtkLabelClass.class
    open GtkLabelClass
    type 'a accel_label = unit
    type 'a class = 'a accel_label class
  end
