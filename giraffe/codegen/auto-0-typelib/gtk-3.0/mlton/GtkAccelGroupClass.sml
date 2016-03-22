structure GtkAccelGroupClass :>
  GTK_ACCEL_GROUP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a accel_group = unit
    type 'a class = 'a accel_group class
  end
