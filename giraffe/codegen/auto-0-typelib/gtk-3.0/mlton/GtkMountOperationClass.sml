structure GtkMountOperationClass :>
  GTK_MOUNT_OPERATION_CLASS
    where type C.notnull = GioMountOperationClass.C.notnull
    where type 'a C.p = 'a GioMountOperationClass.C.p =
  struct
    type 'a mount_operation = unit
    type 'a class = 'a mount_operation GioMountOperationClass.class
    type t = base class
    fun toBase obj = obj
    val t = GioMountOperationClass.t
    val tOpt = GioMountOperationClass.tOpt
    structure C = GioMountOperationClass.C
  end
