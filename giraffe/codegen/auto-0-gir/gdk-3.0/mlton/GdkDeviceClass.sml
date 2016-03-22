structure GdkDeviceClass :>
  GDK_DEVICE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a device = unit
    type 'a class = 'a device class
  end
