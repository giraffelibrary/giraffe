structure GioSettings :>
  GIO_SETTINGS
    where type 'a class_t = 'a GioSettingsClass.t
    where type settings_backend_record_t = GioSettingsBackendRecord.t
    where type settings_bind_flags_t = GioSettingsBindFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_settings_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_settings_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithBackend_ = call (load_sym libgio "g_settings_new_with_backend") (FFI.String.PolyML.INPTR &&> GioSettingsBackendRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val newWithBackendAndPath_ =
        call (load_sym libgio "g_settings_new_with_backend_and_path")
          (
            FFI.String.PolyML.INPTR
             &&> GioSettingsBackendRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val newWithPath_ = call (load_sym libgio "g_settings_new_with_path") (FFI.String.PolyML.INPTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val sync_ = call (load_sym libgio "g_settings_sync") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val apply_ = call (load_sym libgio "g_settings_apply") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val bind_ =
        call (load_sym libgio "g_settings_bind")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GioSettingsBindFlags.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val bindWritable_ =
        call (load_sym libgio "g_settings_bind_writable")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val delay_ = call (load_sym libgio "g_settings_delay") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getBoolean_ = call (load_sym libgio "g_settings_get_boolean") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val getChild_ = call (load_sym libgio "g_settings_get_child") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getDouble_ = call (load_sym libgio "g_settings_get_double") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Double.PolyML.VAL)
      val getEnum_ = call (load_sym libgio "g_settings_get_enum") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Int32.PolyML.VAL)
      val getFlags_ = call (load_sym libgio "g_settings_get_flags") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.UInt32.PolyML.VAL)
      val getHasUnapplied_ = call (load_sym libgio "g_settings_get_has_unapplied") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getInt_ = call (load_sym libgio "g_settings_get_int") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Int32.PolyML.VAL)
      val getRange_ = call (load_sym libgio "g_settings_get_range") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GLibVariantRecord.PolyML.PTR)
      val getString_ = call (load_sym libgio "g_settings_get_string") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val getUint_ = call (load_sym libgio "g_settings_get_uint") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.UInt32.PolyML.VAL)
      val getValue_ = call (load_sym libgio "g_settings_get_value") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GLibVariantRecord.PolyML.PTR)
      val isWritable_ = call (load_sym libgio "g_settings_is_writable") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val rangeCheck_ =
        call (load_sym libgio "g_settings_range_check")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibVariantRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val reset_ = call (load_sym libgio "g_settings_reset") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val revert_ = call (load_sym libgio "g_settings_revert") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setBoolean_ =
        call (load_sym libgio "g_settings_set_boolean")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val setDouble_ =
        call (load_sym libgio "g_settings_set_double")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val setEnum_ =
        call (load_sym libgio "g_settings_set_enum")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val setFlags_ =
        call (load_sym libgio "g_settings_set_flags")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val setInt_ =
        call (load_sym libgio "g_settings_set_int")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val setString_ =
        call (load_sym libgio "g_settings_set_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.Bool.PolyML.VAL
          )
      val setUint_ =
        call (load_sym libgio "g_settings_set_uint")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val setValue_ =
        call (load_sym libgio "g_settings_set_value")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibVariantRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioSettingsClass.t
    type settings_backend_record_t = GioSettingsBackendRecord.t
    type settings_bind_flags_t = GioSettingsBindFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new schema = (FFI.String.C.withConstPtr ---> GioSettingsClass.C.fromPtr true) new_ schema
    fun newWithBackend schema backend = (FFI.String.C.withConstPtr &&&> GioSettingsBackendRecord.C.withPtr ---> GioSettingsClass.C.fromPtr true) newWithBackend_ (schema & backend)
    fun newWithBackendAndPath schema backend path =
      (
        FFI.String.C.withConstPtr
         &&&> GioSettingsBackendRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> GioSettingsClass.C.fromPtr true
      )
        newWithBackendAndPath_
        (
          schema
           & backend
           & path
        )
    fun newWithPath schema path = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> GioSettingsClass.C.fromPtr true) newWithPath_ (schema & path)
    fun sync () = (I ---> I) sync_ ()
    fun apply self = (GObjectObjectClass.C.withPtr ---> I) apply_ self
    fun bind self key object property flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
    fun delay self = (GObjectObjectClass.C.withPtr ---> I) delay_ self
    fun getBoolean self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) getBoolean_ (self & key)
    fun getChild self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioSettingsClass.C.fromPtr true) getChild_ (self & name)
    fun getDouble self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Double.C.fromVal) getDouble_ (self & key)
    fun getEnum self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int32.C.fromVal) getEnum_ (self & key)
    fun getFlags self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.UInt32.C.fromVal) getFlags_ (self & key)
    fun getHasUnapplied self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasUnapplied_ self
    fun getInt self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int32.C.fromVal) getInt_ (self & key)
    fun getRange self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GLibVariantRecord.C.fromPtr true) getRange_ (self & key)
    fun getString self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) getString_ (self & key)
    fun getUint self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.UInt32.C.fromVal) getUint_ (self & key)
    fun getValue self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GLibVariantRecord.C.fromPtr true) getValue_ (self & key)
    fun isWritable self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) isWritable_ (self & name)
    fun rangeCheck self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        rangeCheck_
        (
          self
           & key
           & value
        )
    fun reset self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) reset_ (self & key)
    fun revert self = (GObjectObjectClass.C.withPtr ---> I) revert_ self
    fun setBoolean self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
