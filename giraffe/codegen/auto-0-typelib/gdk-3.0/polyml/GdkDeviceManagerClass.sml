structure GdkDeviceManagerClass :>
  GDK_DEVICE_MANAGER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a device_manager = unit
    type 'a class = 'a device_manager class
  end
