structure GtkAccelMapClass :>
  GTK_ACCEL_MAP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a accel_map = unit
    type 'a class = 'a accel_map class
  end
