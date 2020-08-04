structure GioSettingsSchemaSource :>
  GIO_SETTINGS_SCHEMA_SOURCE
    where type t = GioSettingsSchemaSourceRecord.t
    where type settings_schema_t = GioSettingsSchemaRecord.t =
  struct
    val getType_ = _import "g_settings_schema_source_get_type" : unit -> GObjectType.FFI.val_;
    val newFromDirectory_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_g_settings_schema_source_new_from_directory" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioSettingsSchemaSourceRecord.FFI.opt GioSettingsSchemaSourceRecord.FFI.p
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSettingsSchemaSourceRecord.FFI.non_opt GioSettingsSchemaSourceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val listSchemas_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_settings_schema_source_list_schemas" :
              GioSettingsSchemaSourceRecord.FFI.non_opt GioSettingsSchemaSourceRecord.FFI.p
               * GBool.FFI.val_
               * Utf8CPtrArray.MLton.r1
               * (Utf8CPtrArray.FFI.opt, Utf8CPtrArray.FFI.non_opt) Utf8CPtrArray.MLton.r2
               * Utf8CPtrArray.MLton.r1
               * (Utf8CPtrArray.FFI.opt, Utf8CPtrArray.FFI.non_opt) Utf8CPtrArray.MLton.r2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val lookup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_schema_source_lookup" :
              GioSettingsSchemaSourceRecord.FFI.non_opt GioSettingsSchemaSourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> GioSettingsSchemaRecord.FFI.opt GioSettingsSchemaRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDefault_ = _import "g_settings_schema_source_get_default" : unit -> GioSettingsSchemaSourceRecord.FFI.non_opt GioSettingsSchemaSourceRecord.FFI.p;
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
