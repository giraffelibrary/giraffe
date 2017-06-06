structure GioIOExtensionRecord :> GIO_I_O_EXTENSION_RECORD =
  struct
    structure Record = PointerRecord(val name = "GioIOExtensionRecord")
    open Record
  end
