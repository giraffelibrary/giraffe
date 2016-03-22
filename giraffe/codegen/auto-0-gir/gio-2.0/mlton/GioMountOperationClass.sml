structure GioMountOperationClass :>
  GIO_MOUNT_OPERATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a mount_operation = unit
    type 'a class = 'a mount_operation class
  end
