structure GioUnixMountEntryRecord :> GIO_UNIX_MOUNT_ENTRY_RECORD =
  struct
    structure Record =
      PointerRecord(
        val name = "Gio.UnixMountEntry"
      )
    open Record
  end
