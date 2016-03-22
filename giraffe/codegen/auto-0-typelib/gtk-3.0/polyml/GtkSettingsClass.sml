structure GtkSettingsClass :>
  GTK_SETTINGS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a settings = unit
    type 'a class = 'a settings class
  end
