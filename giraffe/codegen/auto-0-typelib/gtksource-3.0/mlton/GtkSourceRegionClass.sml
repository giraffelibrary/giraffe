structure GtkSourceRegionClass :>
  GTK_SOURCE_REGION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a region = unit
    type 'a class = 'a region class
  end
