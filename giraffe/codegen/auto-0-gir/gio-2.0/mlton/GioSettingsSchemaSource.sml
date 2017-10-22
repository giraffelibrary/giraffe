structure GioSettingsSchemaSource :>
  GIO_SETTINGS_SCHEMA_SOURCE
    where type t = GioSettingsSchemaSourceRecord.t
    where type settings_schema_t = GioSettingsSchemaRecord.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioSettingsSchemaSourceRecord.FFI.p
               * GBool.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSettingsSchemaSourceRecord.FFI.notnull GioSettingsSchemaSourceRecord.FFI.p;
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
              GioSettingsSchemaSourceRecord.FFI.notnull GioSettingsSchemaSourceRecord.FFI.p
               * GBool.FFI.val_
               * Utf8CVector.MLton.r1
               * (unit, Utf8CVector.FFI.notnull) Utf8CVector.MLton.r2
               * Utf8CVector.MLton.r1
               * (unit, Utf8CVector.FFI.notnull) Utf8CVector.MLton.r2
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
              GioSettingsSchemaSourceRecord.FFI.notnull GioSettingsSchemaSourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               -> GioSettingsSchemaRecord.FFI.notnull GioSettingsSchemaRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDefault_ = _import "g_settings_schema_source_get_default" : unit -> GioSettingsSchemaSourceRecord.FFI.notnull GioSettingsSchemaSourceRecord.FFI.p;
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
        Utf8.FFI.withPtr
         &&&> GioSettingsSchemaSourceRecord.FFI.withOptPtr
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
            GioSettingsSchemaSourceRecord.FFI.withPtr
             &&&> GBool.FFI.withVal
             &&&> Utf8CVector.FFI.withRefOptPtr
             &&&> Utf8CVector.FFI.withRefOptPtr
             ---> Utf8CVector.FFI.fromPtr 2
                   && Utf8CVector.FFI.fromPtr 2
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
        GioSettingsSchemaSourceRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GioSettingsSchemaRecord.FFI.fromPtr true
      )
        lookup_
        (
          self
           & schemaId
           & recursive
        )
    fun getDefault () = (I ---> GioSettingsSchemaSourceRecord.FFI.fromPtr false) getDefault_ ()
  end
