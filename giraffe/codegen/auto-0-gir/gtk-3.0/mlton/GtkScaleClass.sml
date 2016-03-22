structure GtkScaleClass :>
  GTK_SCALE_CLASS
    where type 'a range_class = 'a GtkRangeClass.class
    where type C.notnull = GtkRangeClass.C.notnull
    where type 'a C.p = 'a GtkRangeClass.C.p =
  struct
    type 'a range_class = 'a GtkRangeClass.class
    open GtkRangeClass
    type 'a scale = unit
    type 'a class = 'a scale class
  end
