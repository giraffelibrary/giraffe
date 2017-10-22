structure GtkScaleAccessibleClass :>
  GTK_SCALE_ACCESSIBLE_CLASS
    where type 'a range_accessible_class = 'a GtkRangeAccessibleClass.class
    where type C.notnull = GtkRangeAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkRangeAccessibleClass.C.p =
  struct
    type 'a range_accessible_class = 'a GtkRangeAccessibleClass.class
    open GtkRangeAccessibleClass
    type 'a scale_accessible = unit
    type 'a class = 'a scale_accessible class
  end
