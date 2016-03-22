structure GioMountClass :>
  GIO_MOUNT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a mount = unit
    type 'a class = 'a mount class
  end
