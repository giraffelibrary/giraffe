structure GioSettingsSchemaSource :>
  GIO_SETTINGS_SCHEMA_SOURCE
    where type t = GioSettingsSchemaSourceRecord.t
    where type settings_schema_t = GioSettingsSchemaRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_settings_schema_source_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFromDirectory_ =
        call (getSymbol "g_settings_schema_source_new_from_directory")
          (
            Utf8.PolyML.cInPtr
             &&> GioSettingsSchemaSourceRecord.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSettingsSchemaSourceRecord.PolyML.cPtr
          )
      val listSchemas_ =
        call (getSymbol "g_settings_schema_source_list_schemas")
          (
            GioSettingsSchemaSourceRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> Utf8CPtrArray.PolyML.cOutRef
             &&> Utf8CPtrArray.PolyML.cOutRef
             --> cVoid
          )
      val lookup_ =
        call (getSymbol "g_settings_schema_source_lookup")
          (
            GioSettingsSchemaSourceRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> GioSettingsSchemaRecord.PolyML.cOptPtr
          )
      val getDefault_ = call (getSymbol "g_settings_schema_source_get_default") (cVoid --> GioSettingsSchemaSourceRecord.PolyML.cPtr)
    end
    type t = GioSettingsSchemaSourceRecord.t
    type settings_schema_t = GioSettingsSchemaRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromDirectory
      (
        directory,
        parent,
        trusted
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GioSettingsSchemaSourceRecord.FFI.withOptPtr false
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSettingsSchemaSourceRecord.FFI.fromPtr true
      )
        newFromDirectory_
        (
          directory
           & parent
           & trusted
           & []
        )
    fun listSchemas self recursive =
      let
        val nonRelocatable
         & relocatable
         & () =
          (
            GioSettingsSchemaSourceRecord.FFI.withPtr false
             &&&> GBool.FFI.withVal
             &&&> Utf8CPtrArray.FFI.withRefOptPtr 0
             &&&> Utf8CPtrArray.FFI.withRefOptPtr 0
             ---> Utf8CPtrArray.FFI.fromPtr ~1
                   && Utf8CPtrArray.FFI.fromPtr ~1
                   && I
          )
            listSchemas_
            (
              self
               & recursive
               & NONE
               & NONE
            )
      in
        (nonRelocatable, relocatable)
      end
    fun lookup self (schemaId, recursive) =
      (
        GioSettingsSchemaSourceRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         ---> GioSettingsSchemaRecord.FFI.fromOptPtr true
      )
        lookup_
        (
          self
           & schemaId
           & recursive
        )
    fun getDefault () = (I ---> GioSettingsSchemaSourceRecord.FFI.fromPtr false) getDefault_ ()
  end
