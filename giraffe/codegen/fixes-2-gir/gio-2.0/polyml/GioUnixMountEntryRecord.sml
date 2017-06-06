structure GioUnixMountEntryRecord :> GIO_UNIX_MOUNT_ENTRY_RECORD =
  struct
    structure Record = PointerRecord(val name = "GioUnixMountEntryRecord")
    open Record
  end
