structure GtkSettingsValue :>
  GTK_SETTINGS_VALUE
    where type record_t = GtkSettingsValueRecord.t =
  struct
    type record_t = GtkSettingsValueRecord.t
    type t = record_t
  end
