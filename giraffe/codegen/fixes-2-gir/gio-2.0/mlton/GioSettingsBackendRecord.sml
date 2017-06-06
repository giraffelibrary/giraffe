structure GioSettingsBackendRecord :> GIO_SETTINGS_BACKEND_RECORD =
  struct
    structure Record = PointerRecord(val name = "GioSettingsBackendRecord")
    open Record
  end
