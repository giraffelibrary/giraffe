structure GioUnixMountPointRecord :> GIO_UNIX_MOUNT_POINT_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val dup_ = _import "g_unix_mount_point_copy" : notnull p -> notnull p;
    val free_ = _import "g_unix_mount_point_free" : notnull p -> unit;
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
  end
