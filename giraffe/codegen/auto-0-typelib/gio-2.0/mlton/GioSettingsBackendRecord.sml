structure GioSettingsBackendRecord :> GIO_SETTINGS_BACKEND_RECORD =
  struct
    structure Record =
      PointerRecord(
        val name = "Gio.SettingsBackend"
      )
    open Record
  end
