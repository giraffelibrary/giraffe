structure GioIOExtensionPointRecord :> GIO_I_O_EXTENSION_POINT_RECORD =
  struct
    structure Record =
      PointerRecord(
        val name = "Gio.IOExtensionPoint"
      )
    open Record
  end
