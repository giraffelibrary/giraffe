structure GtkMountOperationClass :>
  GTK_MOUNT_OPERATION_CLASS
    where type C.notnull = GioMountOperationClass.C.notnull
    where type 'a C.p = 'a GioMountOperationClass.C.p =
  struct
    open GioMountOperationClass
    type 'a mount_operation = unit
    type 'a class = 'a mount_operation class
  end
