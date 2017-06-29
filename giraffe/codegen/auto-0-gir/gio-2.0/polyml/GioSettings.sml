structure GioSettings :>
  GIO_SETTINGS
    where type 'a class = 'a GioSettingsClass.class
    where type settings_backend_t = GioSettingsBackendRecord.t
    where type settings_bind_flags_t = GioSettingsBindFlags.t =
  struct
    structure GLibQuarkCVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt32Type
        structure ElemSequence = CValueVectorSequence(GUInt32Type)
      )
    structure GLibQuarkCVectorN = CVectorN(GLibQuarkCVectorNType)
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_settings_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_settings_new") (Utf8.PolyML.cInPtr --> GioSettingsClass.PolyML.cPtr)
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
      val listRelocatableSchemas_ = call (getSymbol "g_settings_list_relocatable_schemas") (PolyMLFFI.cVoid --> Utf8CVector.PolyML.cOutPtr)
      val listSchemas_ = call (getSymbol "g_settings_list_schemas") (PolyMLFFI.cVoid --> Utf8CVector.PolyML.cOutPtr)
      val sync_ = call (getSymbol "g_settings_sync") (PolyMLFFI.cVoid --> PolyMLFFI.cVoid)
      val apply_ = call (getSymbol "g_settings_apply") (GioSettingsClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val bind_ =
        call (getSymbol "g_settings_bind")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioSettingsBindFlags.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val bindWritable_ =
        call (getSymbol "g_settings_bind_writable")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val delay_ = call (getSymbol "g_settings_delay") (GioSettingsClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getBoolean_ = call (getSymbol "g_settings_get_boolean") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val getChild_ = call (getSymbol "g_settings_get_child") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioSettingsClass.PolyML.cPtr)
      val getDouble_ = call (getSymbol "g_settings_get_double") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GDouble.PolyML.cVal)
      val getEnum_ = call (getSymbol "g_settings_get_enum") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val getFlags_ = call (getSymbol "g_settings_get_flags") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GUInt.PolyML.cVal)
      val getHasUnapplied_ = call (getSymbol "g_settings_get_has_unapplied") (GioSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInt_ = call (getSymbol "g_settings_get_int") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val getRange_ = call (getSymbol "g_settings_get_range") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val getString_ = call (getSymbol "g_settings_get_string") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getStrv_ = call (getSymbol "g_settings_get_strv") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CVector.PolyML.cOutPtr)
      val getUint_ = call (getSymbol "g_settings_get_uint") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GUInt.PolyML.cVal)
      val getValue_ = call (getSymbol "g_settings_get_value") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val isWritable_ = call (getSymbol "g_settings_is_writable") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val listChildren_ = call (getSymbol "g_settings_list_children") (GioSettingsClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val listKeys_ = call (getSymbol "g_settings_list_keys") (GioSettingsClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val rangeCheck_ =
        call (getSymbol "g_settings_range_check")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val reset_ = call (getSymbol "g_settings_reset") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val revert_ = call (getSymbol "g_settings_revert") (GioSettingsClass.PolyML.cPtr --> PolyMLFFI.cVoid)
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
             &&> Utf8CVector.PolyML.cInOptPtr
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
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new schema = (Utf8.FFI.withPtr ---> GioSettingsClass.FFI.fromPtr true) new_ schema
    fun newWithBackend schema backend = (Utf8.FFI.withPtr &&&> GioSettingsBackendRecord.FFI.withPtr ---> GioSettingsClass.FFI.fromPtr true) newWithBackend_ (schema & backend)
    fun newWithBackendAndPath schema backend path =
      (
        Utf8.FFI.withPtr
         &&&> GioSettingsBackendRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GioSettingsClass.FFI.fromPtr true
      )
        newWithBackendAndPath_
        (
          schema
           & backend
           & path
        )
    fun newWithPath schema path = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioSettingsClass.FFI.fromPtr true) newWithPath_ (schema & path)
    fun listRelocatableSchemas () = (I ---> Utf8CVector.FFI.fromPtr 0) listRelocatableSchemas_ ()
    fun listSchemas () = (I ---> Utf8CVector.FFI.fromPtr 0) listSchemas_ ()
    fun sync () = (I ---> I) sync_ ()
    fun apply self = (GioSettingsClass.FFI.withPtr ---> I) apply_ self
    fun bind self key object property flags =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
    fun bindWritable self key object property inverted =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
    fun delay self = (GioSettingsClass.FFI.withPtr ---> I) delay_ self
    fun getBoolean self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) getBoolean_ (self & key)
    fun getChild self name = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioSettingsClass.FFI.fromPtr true) getChild_ (self & name)
    fun getDouble self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GDouble.FFI.fromVal) getDouble_ (self & key)
    fun getEnum self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) getEnum_ (self & key)
    fun getFlags self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GUInt.FFI.fromVal) getFlags_ (self & key)
    fun getHasUnapplied self = (GioSettingsClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasUnapplied_ self
    fun getInt self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) getInt_ (self & key)
    fun getRange self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getRange_ (self & key)
    fun getString self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getString_ (self & key)
    fun getStrv self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getStrv_ (self & key)
    fun getUint self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GUInt.FFI.fromVal) getUint_ (self & key)
    fun getValue self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getValue_ (self & key)
    fun isWritable self name = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) isWritable_ (self & name)
    fun listChildren self = (GioSettingsClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) listChildren_ self
    fun listKeys self = (GioSettingsClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) listKeys_ self
    fun rangeCheck self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        rangeCheck_
        (
          self
           & key
           & value
        )
    fun reset self key = (GioSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) reset_ (self & key)
    fun revert self = (GioSettingsClass.FFI.withPtr ---> I) revert_ self
    fun setBoolean self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setBoolean_
        (
          self
           & key
           & value
        )
    fun setDouble self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setDouble_
        (
          self
           & key
           & value
        )
    fun setEnum self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setEnum_
        (
          self
           & key
           & value
        )
    fun setFlags self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setFlags_
        (
          self
           & key
           & value
        )
    fun setInt self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setInt_
        (
          self
           & key
           & value
        )
    fun setString self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        setString_
        (
          self
           & key
           & value
        )
    fun setStrv self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8CVector.FFI.withOptPtr
         ---> GBool.FFI.fromVal
      )
        setStrv_
        (
          self
           & key
           & value
        )
    fun setUint self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setUint_
        (
          self
           & key
           & value
        )
    fun setValue self key value =
      (
        GioSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withPtr
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
      fun changeEventSig f = signal "change-event" (get 0w1 GLibQuarkCVectorN.tOpt &&&> get 0w2 int ---> ret boolean) (fn keys & nKeys => f (keys (LargeInt.toInt nKeys)))
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
          set = fn x => set "path" stringOpt x
        }
      val schemaProp =
        {
          get = fn x => get "schema" stringOpt x,
          set = fn x => set "schema" stringOpt x
        }
    end
  end
