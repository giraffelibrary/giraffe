structure GioSettings :>
  GIO_SETTINGS
    where type 'a class = 'a GioSettingsClass.class
    where type settings_backend_t = GioSettingsBackendRecord.t
    where type settings_bind_flags_t = GioSettingsBindFlags.t
    where type 'a action_class = 'a GioActionClass.class
    where type settings_schema_t = GioSettingsSchemaRecord.t =
  struct
    val getType_ = _import "g_settings_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_settings_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p;
    val newFull_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_g_settings_new_full" :
              GioSettingsSchemaRecord.FFI.non_opt GioSettingsSchemaRecord.FFI.p
               * GioSettingsBackendRecord.FFI.opt GioSettingsBackendRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newWithBackend_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_settings_new_with_backend" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioSettingsBackendRecord.FFI.non_opt GioSettingsBackendRecord.FFI.p
               -> GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithBackendAndPath_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_settings_new_with_backend_and_path" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioSettingsBackendRecord.FFI.non_opt GioSettingsBackendRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newWithPath_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_settings_new_with_path" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val listRelocatableSchemas_ = _import "g_settings_list_relocatable_schemas" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val listSchemas_ = _import "g_settings_list_schemas" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val sync_ = _import "g_settings_sync" : unit -> unit;
    val unbind_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_unbind" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val apply_ = _import "g_settings_apply" : GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p -> unit;
    val bind_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_settings_bind" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioSettingsBindFlags.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val bindWritable_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_settings_bind_writable" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val createAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_create_action" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioActionClass.FFI.non_opt GioActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val delay_ = _import "g_settings_delay" : GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p -> unit;
    val getBoolean_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_boolean" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getChild_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_child" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultValue_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_default_value" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDouble_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_double" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GDouble.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getEnum_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_enum" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getFlags_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_flags" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getHasUnapplied_ = _import "g_settings_get_has_unapplied" : GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p -> GBool.FFI.val_;
    val getInt_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_int" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getInt64_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_int64" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getRange_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_range" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_string" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getStrv_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_strv" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getUint_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_uint" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getUint64_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_uint64" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GUInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getUserValue_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_user_value" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getValue_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_value" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val isWritable_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_is_writable" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val listChildren_ = _import "g_settings_list_children" : GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val listKeys_ = _import "g_settings_list_keys" : GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val rangeCheck_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_range_check" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val reset_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_reset" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val revert_ = _import "g_settings_revert" : GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p -> unit;
    val setBoolean_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_boolean" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDouble_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_double" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GDouble.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setEnum_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_enum" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFlags_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_flags" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setInt_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_int" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setInt64_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_int64" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt64.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_settings_set_string" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setStrv_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_settings_set_strv" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.opt Utf8CPtrArray.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setUint_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_uint" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setUint64_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_uint64" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt64.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_value" :
              GioSettingsClass.FFI.non_opt GioSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GioSettingsClass.class
    type settings_backend_t = GioSettingsBackendRecord.t
    type settings_bind_flags_t = GioSettingsBindFlags.t
    type 'a action_class = 'a GioActionClass.class
    type settings_schema_t = GioSettingsSchemaRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new schemaId = (Utf8.FFI.withPtr 0 ---> GioSettingsClass.FFI.fromPtr true) new_ schemaId
    fun newFull
      (
        schema,
        backend,
        path
      ) =
      (
        GioSettingsSchemaRecord.FFI.withPtr false
         &&&> GioSettingsBackendRecord.FFI.withOptPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> GioSettingsClass.FFI.fromPtr true
      )
        newFull_
        (
          schema
           & backend
           & path
        )
    fun newWithBackend (schemaId, backend) = (Utf8.FFI.withPtr 0 &&&> GioSettingsBackendRecord.FFI.withPtr false ---> GioSettingsClass.FFI.fromPtr true) newWithBackend_ (schemaId & backend)
    fun newWithBackendAndPath
      (
        schemaId,
        backend,
        path
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GioSettingsBackendRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> GioSettingsClass.FFI.fromPtr true
      )
        newWithBackendAndPath_
        (
          schemaId
           & backend
           & path
        )
    fun newWithPath (schemaId, path) = (Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withPtr 0 ---> GioSettingsClass.FFI.fromPtr true) newWithPath_ (schemaId & path)
    fun listRelocatableSchemas () = (I ---> Utf8CPtrArray.FFI.fromPtr 0) listRelocatableSchemas_ ()
    fun listSchemas () = (I ---> Utf8CPtrArray.FFI.fromPtr 0) listSchemas_ ()
    fun sync () = (I ---> I) sync_ ()
    fun unbind (object, property) = (GObjectObjectClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) unbind_ (object & property)
    fun apply self = (GioSettingsClass.FFI.withPtr false ---> I) apply_ self
    fun bind
      self
      (
        key,
        object,
        property,
        flags
      ) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioSettingsBindFlags.FFI.withVal
         ---> I
      )
        bind_
        (
          self
           & key
           & object
           & property
           & flags
        )
    fun bindWritable
      self
      (
        key,
        object,
        property,
        inverted
      ) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         ---> I
      )
        bindWritable_
        (
          self
           & key
           & object
           & property
           & inverted
        )
    fun createAction self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioActionClass.FFI.fromPtr true) createAction_ (self & key)
    fun delay self = (GioSettingsClass.FFI.withPtr false ---> I) delay_ self
    fun getBoolean self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) getBoolean_ (self & key)
    fun getChild self name = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioSettingsClass.FFI.fromPtr true) getChild_ (self & name)
    fun getDefaultValue self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantRecord.FFI.fromOptPtr true) getDefaultValue_ (self & key)
    fun getDouble self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GDouble.FFI.fromVal) getDouble_ (self & key)
    fun getEnum self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal) getEnum_ (self & key)
    fun getFlags self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GUInt.FFI.fromVal) getFlags_ (self & key)
    fun getHasUnapplied self = (GioSettingsClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasUnapplied_ self
    fun getInt self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal) getInt_ (self & key)
    fun getInt64 self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt64.FFI.fromVal) getInt64_ (self & key)
    fun getRange self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantRecord.FFI.fromPtr true) getRange_ (self & key)
    fun getString self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) getString_ (self & key)
    fun getStrv self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) getStrv_ (self & key)
    fun getUint self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GUInt.FFI.fromVal) getUint_ (self & key)
    fun getUint64 self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GUInt64.FFI.fromVal) getUint64_ (self & key)
    fun getUserValue self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantRecord.FFI.fromOptPtr true) getUserValue_ (self & key)
    fun getValue self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantRecord.FFI.fromPtr true) getValue_ (self & key)
    fun isWritable self name = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) isWritable_ (self & name)
    fun listChildren self = (GioSettingsClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) listChildren_ self
    fun listKeys self = (GioSettingsClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) listKeys_ self
    fun rangeCheck self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        rangeCheck_
        (
          self
           & key
           & value
        )
    fun reset self key = (GioSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) reset_ (self & key)
    fun revert self = (GioSettingsClass.FFI.withPtr false ---> I) revert_ self
    fun setBoolean self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setBoolean_
        (
          self
           & key
           & value
        )
    fun setDouble self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setDouble_
        (
          self
           & key
           & value
        )
    fun setEnum self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setEnum_
        (
          self
           & key
           & value
        )
    fun setFlags self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setFlags_
        (
          self
           & key
           & value
        )
    fun setInt self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setInt_
        (
          self
           & key
           & value
        )
    fun setInt64 self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setInt64_
        (
          self
           & key
           & value
        )
    fun setString self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        setString_
        (
          self
           & key
           & value
        )
    fun setStrv self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withOptPtr 0
         ---> GBool.FFI.fromVal
      )
        setStrv_
        (
          self
           & key
           & value
        )
    fun setUint self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setUint_
        (
          self
           & key
           & value
        )
    fun setUint64 self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setUint64_
        (
          self
           & key
           & value
        )
    fun setValue self (key, value) =
      (
        GioSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        setValue_
        (
          self
           & key
           & value
        )
    local
      open ClosureMarshal Signal
    in
      fun changeEventSig f = signal "change-event" (get 0w1 GLibQuarkCArrayN.tOpt &&&> get 0w2 int ---> ret boolean) (fn keys & nKeys => f (keys (LargeInt.toInt nKeys)))
      fun changedSig f = signal "changed" (get 0w1 string ---> ret_void) f
      fun writableChangeEventSig f = signal "writable-change-event" (get 0w1 uint ---> ret boolean) f
      fun writableChangedSig f = signal "writable-changed" (get 0w1 string ---> ret_void) f
    end
    local
      open Property
    in
      val delayApplyProp = {get = fn x => get "delay-apply" boolean x}
      val hasUnappliedProp = {get = fn x => get "has-unapplied" boolean x}
      val pathProp =
        {
          get = fn x => get "path" stringOpt x,
          new = fn x => new "path" stringOpt x
        }
      val schemaProp =
        {
          get = fn x => get "schema" stringOpt x,
          new = fn x => new "schema" stringOpt x
        }
      val schemaIdProp =
        {
          get = fn x => get "schema-id" stringOpt x,
          new = fn x => new "schema-id" stringOpt x
        }
      val settingsSchemaProp =
        {
          get = fn x => get "settings-schema" GioSettingsSchemaRecord.tOpt x,
          new = fn x => new "settings-schema" GioSettingsSchemaRecord.tOpt x
        }
    end
  end
