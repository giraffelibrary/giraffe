signature GIO_SETTINGS_SCHEMA =
  sig
    type t
    type settings_schema_key_t
    val getType : unit -> GObject.Type.t
    val getId : t -> string
    val getKey :
      t
       -> string
       -> settings_schema_key_t
    val getPath : t -> string
    val hasKey :
      t
       -> string
       -> bool
    val listChildren : t -> Utf8CPtrArray.t
    val listKeys : t -> Utf8CPtrArray.t
  end
