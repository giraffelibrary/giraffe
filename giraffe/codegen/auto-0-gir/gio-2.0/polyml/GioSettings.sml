structure GioSettings :>
  GIO_SETTINGS
    where type 'a class = 'a GioSettingsClass.class
    where type settings_backend_t = GioSettingsBackendRecord.t
    where type settings_bind_flags_t = GioSettingsBindFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_settings_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_settings_new") (Utf8.PolyML.cInPtr --> GioSettingsClass.PolyML.cPtr)
      val newWithBackend_ = call (load_sym libgio "g_settings_new_with_backend") (Utf8.PolyML.cInPtr &&> GioSettingsBackendRecord.PolyML.cPtr --> GioSettingsClass.PolyML.cPtr)
      val newWithBackendAndPath_ =
        call (load_sym libgio "g_settings_new_with_backend_and_path")
          (
            Utf8.PolyML.cInPtr
             &&> GioSettingsBackendRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GioSettingsClass.PolyML.cPtr
          )
      val newWithPath_ = call (load_sym libgio "g_settings_new_with_path") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GioSettingsClass.PolyML.cPtr)
      val sync_ = call (load_sym libgio "g_settings_sync") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val apply_ = call (load_sym libgio "g_settings_apply") (GioSettingsClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val bind_ =
        call (load_sym libgio "g_settings_bind")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioSettingsBindFlags.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val bindWritable_ =
        call (load_sym libgio "g_settings_bind_writable")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val delay_ = call (load_sym libgio "g_settings_delay") (GioSettingsClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getBoolean_ = call (load_sym libgio "g_settings_get_boolean") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val getChild_ = call (load_sym libgio "g_settings_get_child") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioSettingsClass.PolyML.cPtr)
      val getDouble_ = call (load_sym libgio "g_settings_get_double") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Double.PolyML.cVal)
      val getEnum_ = call (load_sym libgio "g_settings_get_enum") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val getFlags_ = call (load_sym libgio "g_settings_get_flags") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.UInt.PolyML.cVal)
      val getHasUnapplied_ = call (load_sym libgio "g_settings_get_has_unapplied") (GioSettingsClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getInt_ = call (load_sym libgio "g_settings_get_int") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val getRange_ = call (load_sym libgio "g_settings_get_range") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val getString_ = call (load_sym libgio "g_settings_get_string") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getUint_ = call (load_sym libgio "g_settings_get_uint") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.UInt.PolyML.cVal)
      val getValue_ = call (load_sym libgio "g_settings_get_value") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val isWritable_ = call (load_sym libgio "g_settings_is_writable") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val rangeCheck_ =
        call (load_sym libgio "g_settings_range_check")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val reset_ = call (load_sym libgio "g_settings_reset") (GioSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val revert_ = call (load_sym libgio "g_settings_revert") (GioSettingsClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setBoolean_ =
        call (load_sym libgio "g_settings_set_boolean")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setDouble_ =
        call (load_sym libgio "g_settings_set_double")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setEnum_ =
        call (load_sym libgio "g_settings_set_enum")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setFlags_ =
        call (load_sym libgio "g_settings_set_flags")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setInt_ =
        call (load_sym libgio "g_settings_set_int")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setString_ =
        call (load_sym libgio "g_settings_set_string")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
      val setUint_ =
        call (load_sym libgio "g_settings_set_uint")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val setValue_ =
        call (load_sym libgio "g_settings_set_value")
          (
            GioSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a GioSettingsClass.class
    type settings_backend_t = GioSettingsBackendRecord.t
    type settings_bind_flags_t = GioSettingsBindFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new schema = (Utf8.C.withPtr ---> GioSettingsClass.C.fromPtr true) new_ schema
    fun newWithBackend schema backend = (Utf8.C.withPtr &&&> GioSettingsBackendRecord.C.withPtr ---> GioSettingsClass.C.fromPtr true) newWithBackend_ (schema & backend)
    fun newWithBackendAndPath schema backend path =
      (
        Utf8.C.withPtr
         &&&> GioSettingsBackendRecord.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GioSettingsClass.C.fromPtr true
      )
        newWithBackendAndPath_
        (
          schema
           & backend
           & path
        )
    fun newWithPath schema path = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> GioSettingsClass.C.fromPtr true) newWithPath_ (schema & path)
    fun sync () = (I ---> I) sync_ ()
    fun apply self = (GioSettingsClass.C.withPtr ---> I) apply_ self
    fun bind self key object property flags =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioSettingsBindFlags.C.withVal
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
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Bool.C.withVal
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
    fun delay self = (GioSettingsClass.C.withPtr ---> I) delay_ self
    fun getBoolean self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getBoolean_ (self & key)
    fun getChild self name = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> GioSettingsClass.C.fromPtr true) getChild_ (self & name)
    fun getDouble self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Double.C.fromVal) getDouble_ (self & key)
    fun getEnum self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) getEnum_ (self & key)
    fun getFlags self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.UInt.C.fromVal) getFlags_ (self & key)
    fun getHasUnapplied self = (GioSettingsClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasUnapplied_ self
    fun getInt self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) getInt_ (self & key)
    fun getRange self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getRange_ (self & key)
    fun getString self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) getString_ (self & key)
    fun getUint self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.UInt.C.fromVal) getUint_ (self & key)
    fun getValue self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getValue_ (self & key)
    fun isWritable self name = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) isWritable_ (self & name)
    fun rangeCheck self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        rangeCheck_
        (
          self
           & key
           & value
        )
    fun reset self key = (GioSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> I) reset_ (self & key)
    fun revert self = (GioSettingsClass.C.withPtr ---> I) revert_ self
    fun setBoolean self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setBoolean_
        (
          self
           & key
           & value
        )
    fun setDouble self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Double.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setDouble_
        (
          self
           & key
           & value
        )
    fun setEnum self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setEnum_
        (
          self
           & key
           & value
        )
    fun setFlags self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setFlags_
        (
          self
           & key
           & value
        )
    fun setInt self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setInt_
        (
          self
           & key
           & value
        )
    fun setString self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        setString_
        (
          self
           & key
           & value
        )
    fun setUint self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setUint_
        (
          self
           & key
           & value
        )
    fun setValue self key value =
      (
        GioSettingsClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
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
