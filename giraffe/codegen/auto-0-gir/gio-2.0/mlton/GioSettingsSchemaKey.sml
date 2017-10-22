structure GioSettingsSchemaKey :>
  GIO_SETTINGS_SCHEMA_KEY
    where type t = GioSettingsSchemaKeyRecord.t =
  struct
    val getType_ = _import "g_settings_schema_key_get_type" : unit -> GObjectType.FFI.val_;
    val getDefaultValue_ = _import "g_settings_schema_key_get_default_value" : GioSettingsSchemaKeyRecord.FFI.notnull GioSettingsSchemaKeyRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val getDescription_ = _import "g_settings_schema_key_get_description" : GioSettingsSchemaKeyRecord.FFI.notnull GioSettingsSchemaKeyRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getName_ = _import "g_settings_schema_key_get_name" : GioSettingsSchemaKeyRecord.FFI.notnull GioSettingsSchemaKeyRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getRange_ = _import "g_settings_schema_key_get_range" : GioSettingsSchemaKeyRecord.FFI.notnull GioSettingsSchemaKeyRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val getSummary_ = _import "g_settings_schema_key_get_summary" : GioSettingsSchemaKeyRecord.FFI.notnull GioSettingsSchemaKeyRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getValueType_ = _import "g_settings_schema_key_get_value_type" : GioSettingsSchemaKeyRecord.FFI.notnull GioSettingsSchemaKeyRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val rangeCheck_ = fn x1 & x2 => (_import "g_settings_schema_key_range_check" : GioSettingsSchemaKeyRecord.FFI.notnull GioSettingsSchemaKeyRecord.FFI.p * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type t = GioSettingsSchemaKeyRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefaultValue self = (GioSettingsSchemaKeyRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getDefaultValue_ self
    fun getDescription self = (GioSettingsSchemaKeyRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getName self = (GioSettingsSchemaKeyRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getRange self = (GioSettingsSchemaKeyRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getRange_ self
    fun getSummary self = (GioSettingsSchemaKeyRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSummary_ self
    fun getValueType self = (GioSettingsSchemaKeyRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) getValueType_ self
    fun rangeCheck self value = (GioSettingsSchemaKeyRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> GBool.FFI.fromVal) rangeCheck_ (self & value)
  end
