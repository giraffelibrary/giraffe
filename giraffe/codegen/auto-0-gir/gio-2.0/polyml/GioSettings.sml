structure GioSettings :>
  GIO_SETTINGS
    where type 'a class = 'a GioSettingsClass.class
    where type settings_backend_t = GioSettingsBackendRecord.t
    where type settings_bind_flags_t = GioSettingsBindFlags.t
    where type 'a action_class = 'a GioActionClass.class
    where type settings_schema_t = GioSettingsSchemaRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_settings_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_settings_new") (Utf8.PolyML.cInPtr --> GioSettingsClass.PolyML.cPtr)
      val newFull_ =
        call (getSymbol "g_settings_new_full")
          (
            GioSettingsSchemaRecord.PolyML.cPtr
             &&> GioSettingsBackendRecord.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GioSettingsClass.PolyML.cPtr
          )
      val newWithBackend_ = call (getSymbol "g_settings_new_with_backend") (Utf8.PolyML.cInPtr &&> GioSettingsBackendRecord.PolyML.cPtr --> GioSettingsClass.PolyML.cPtr)
      val newWithBackendAndPath_ =
        call (getSymbol "g_settings_new_with_backend_and_path")
          (
            Utf8.PolyML.cInPtr
             &&> GioSettingsBackendRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GioSettingsClass.PolyML.cPtr
          )
      val newWithPath_ = call (getSymbol "g_settings_new_with_path") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GioSettingsClass.PolyML.cPtr)
      val listRelocatableSchemas_ = call (getSymbol "g_settings_list_relocatable_schemas") (cVoid --> Utf8CPtrArray.PolyML.cOutPtr)
      val listSchemas_ = call (getSymbol "g_settings_list_schemas") (cVoid --> Utf8CPtrArray.PolyML.cOutPtr)
      val sync_ = call (getSymbol "g_settings_sync") (cVoid --> cVoid)
      val unbind_ = call (getSymbol "g_settings_unbind") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val apply_ = call (getSymbol "g_settings_apply") (GioSettingsClass.PolyML.cPtr --> cVoid)
      val bind_ =
        call (getSymbol "g_settings_bind")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioSettingsBindFlags.PolyML.cVal
             --> cVoid
          )
      val bindWritable_ =
        call (getSymbol "g_settings_bind_writable")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val createAction_ = call (getSymbol "g_settings_create_action") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioActionClass.PolyML.cPtr)
      val delay_ = call (getSymbol "g_settings_delay") (GioSettingsClass.PolyML.cPtr --> cVoid)
      val getBoolean_ = call (getSymbol "g_settings_get_boolean") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val getChild_ = call (getSymbol "g_settings_get_child") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioSettingsClass.PolyML.cPtr)
      val getDefaultValue_ = call (getSymbol "g_settings_get_default_value") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cOptPtr)
      val getDouble_ = call (getSymbol "g_settings_get_double") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GDouble.PolyML.cVal)
      val getEnum_ = call (getSymbol "g_settings_get_enum") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val getFlags_ = call (getSymbol "g_settings_get_flags") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GUInt.PolyML.cVal)
      val getHasUnapplied_ = call (getSymbol "g_settings_get_has_unapplied") (GioSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInt_ = call (getSymbol "g_settings_get_int") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val getInt64_ = call (getSymbol "g_settings_get_int64") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt64.PolyML.cVal)
      val getRange_ = call (getSymbol "g_settings_get_range") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val getString_ = call (getSymbol "g_settings_get_string") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getStrv_ = call (getSymbol "g_settings_get_strv") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getUint_ = call (getSymbol "g_settings_get_uint") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GUInt.PolyML.cVal)
      val getUint64_ = call (getSymbol "g_settings_get_uint64") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GUInt64.PolyML.cVal)
      val getUserValue_ = call (getSymbol "g_settings_get_user_value") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cOptPtr)
      val getValue_ = call (getSymbol "g_settings_get_value") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val isWritable_ = call (getSymbol "g_settings_is_writable") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val listChildren_ = call (getSymbol "g_settings_list_children") (GioSettingsClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val listKeys_ = call (getSymbol "g_settings_list_keys") (GioSettingsClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val rangeCheck_ =
        call (getSymbol "g_settings_range_check")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val reset_ = call (getSymbol "g_settings_reset") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val revert_ = call (getSymbol "g_settings_revert") (GioSettingsClass.PolyML.cPtr --> cVoid)
      val setBoolean_ =
        call (getSymbol "g_settings_set_boolean")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setDouble_ =
        call (getSymbol "g_settings_set_double")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setEnum_ =
        call (getSymbol "g_settings_set_enum")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setFlags_ =
        call (getSymbol "g_settings_set_flags")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setInt_ =
        call (getSymbol "g_settings_set_int")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setInt64_ =
        call (getSymbol "g_settings_set_int64")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setString_ =
        call (getSymbol "g_settings_set_string")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val setStrv_ =
        call (getSymbol "g_settings_set_strv")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInOptPtr
             --> GBool.PolyML.cVal
          )
      val setUint_ =
        call (getSymbol "g_settings_set_uint")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setUint64_ =
        call (getSymbol "g_settings_set_uint64")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val setValue_ =
        call (getSymbol "g_settings_set_value")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
    end
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
      open ValueAccessor
    in
      val delayApplyProp =
        {
          name = "delay-apply",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val hasUnappliedProp =
        {
          name = "has-unapplied",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val pathProp =
        {
          name = "path",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val schemaProp =
        {
          name = "schema",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val schemaIdProp =
        {
          name = "schema-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val settingsSchemaProp =
        {
          name = "settings-schema",
          gtype = fn () => C.gtype GioSettingsSchemaRecord.tOpt (),
          get = fn x => fn () => C.get GioSettingsSchemaRecord.tOpt x,
          set = ignore,
          init = fn x => C.set GioSettingsSchemaRecord.tOpt x
        }
    end
  end
