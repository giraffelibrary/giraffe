structure GioSettingsSchema :>
  GIO_SETTINGS_SCHEMA
    where type t = GioSettingsSchemaRecord.t
    where type settings_schema_key_t = GioSettingsSchemaKeyRecord.t =
  struct
    val getType_ = _import "g_settings_schema_get_type" : unit -> GObjectType.FFI.val_;
    val getId_ = _import "g_settings_schema_get_id" : GioSettingsSchemaRecord.FFI.non_opt GioSettingsSchemaRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getKey_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_schema_get_key" :
              GioSettingsSchemaRecord.FFI.non_opt GioSettingsSchemaRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioSettingsSchemaKeyRecord.FFI.non_opt GioSettingsSchemaKeyRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getPath_ = _import "g_settings_schema_get_path" : GioSettingsSchemaRecord.FFI.non_opt GioSettingsSchemaRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val hasKey_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_schema_has_key" :
              GioSettingsSchemaRecord.FFI.non_opt GioSettingsSchemaRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val listChildren_ = _import "g_settings_schema_list_children" : GioSettingsSchemaRecord.FFI.non_opt GioSettingsSchemaRecord.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val listKeys_ = _import "g_settings_schema_list_keys" : GioSettingsSchemaRecord.FFI.non_opt GioSettingsSchemaRecord.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    type t = GioSettingsSchemaRecord.t
    type settings_schema_key_t = GioSettingsSchemaKeyRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getId self = (GioSettingsSchemaRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getId_ self before GioSettingsSchemaRecord.FFI.touchPtr self
    fun getKey self name = (GioSettingsSchemaRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioSettingsSchemaKeyRecord.FFI.fromPtr true) getKey_ (self & name)
    fun getPath self = (GioSettingsSchemaRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPath_ self before GioSettingsSchemaRecord.FFI.touchPtr self
    fun hasKey self name = (GioSettingsSchemaRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasKey_ (self & name)
    fun listChildren self = (GioSettingsSchemaRecord.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) listChildren_ self
    fun listKeys self = (GioSettingsSchemaRecord.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) listKeys_ self
  end
