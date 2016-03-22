structure GtkPrintSettingsClass :>
  GTK_PRINT_SETTINGS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a print_settings = unit
    type 'a class = 'a print_settings class
  end
