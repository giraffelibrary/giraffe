structure GioSettingsSchemaKey :>
  GIO_SETTINGS_SCHEMA_KEY
    where type t = GioSettingsSchemaKeyRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_settings_schema_key_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefaultValue_ = call (getSymbol "g_settings_schema_key_get_default_value") (GioSettingsSchemaKeyRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getDescription_ = call (getSymbol "g_settings_schema_key_get_description") (GioSettingsSchemaKeyRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "g_settings_schema_key_get_name") (GioSettingsSchemaKeyRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRange_ = call (getSymbol "g_settings_schema_key_get_range") (GioSettingsSchemaKeyRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getSummary_ = call (getSymbol "g_settings_schema_key_get_summary") (GioSettingsSchemaKeyRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getValueType_ = call (getSymbol "g_settings_schema_key_get_value_type") (GioSettingsSchemaKeyRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val rangeCheck_ = call (getSymbol "g_settings_schema_key_range_check") (GioSettingsSchemaKeyRecord.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
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
