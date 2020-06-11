structure GioUnixMountPointRecord :> GIO_UNIX_MOUNT_POINT_RECORD =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val dup_ = _import "g_unix_mount_point_copy" : non_opt p -> non_opt p;
    val free_ = _import "g_unix_mount_point_free" : non_opt p -> unit;
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
  end
