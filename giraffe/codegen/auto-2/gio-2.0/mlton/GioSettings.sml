structure GioSettings :>
  GIO_SETTINGS
    where type 'a class_t = 'a GioSettingsClass.t
    where type settingsbackendrecord_t = GioSettingsBackendRecord.t
    where type settingsbindflags_t = GioSettingsBindFlags.t =
  struct
    val getType_ = _import "g_settings_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_settings_new" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithBackend_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_settings_new_with_backend" :
              cstring
               * unit CPointer.t
               * GioSettingsBackendRecord.C.notnull GioSettingsBackendRecord.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * GioSettingsBackendRecord.C.notnull GioSettingsBackendRecord.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val sync_ = _import "g_settings_sync" : unit -> unit;
    val unbind_ = _import "mlton_g_settings_unbind" : cstring * unit CPointer.t -> unit;
    val apply_ = _import "g_settings_apply" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val bind_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_settings_bind" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GioSettingsBindFlags.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Bool.val_
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
    val delay_ = _import "g_settings_delay" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getBoolean_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_boolean" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Double.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Int32.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.UInt32.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getHasUnapplied_ = _import "g_settings_get_has_unapplied" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getInt_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_int" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Int32.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.UInt32.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val rangeCheck_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_range_check" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val revert_ = _import "g_settings_revert" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setBoolean_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_boolean" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Bool.val_
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Double.val_
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.UInt32.val_
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.UInt32.val_
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GioSettingsClass.t
    type settingsbackendrecord_t = GioSettingsBackendRecord.t
    type settingsbindflags_t = GioSettingsBindFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new schema = (FFI.String.withConstPtr ---> GioSettingsClass.C.fromPtr true) new_ schema
    fun newWithBackend schema backend = (FFI.String.withConstPtr &&&> GioSettingsBackendRecord.C.withPtr ---> GioSettingsClass.C.fromPtr true) newWithBackend_ (schema & backend)
    fun newWithBackendAndPath schema backend path =
      (
        FFI.String.withConstPtr
         &&&> GioSettingsBackendRecord.C.withPtr
         &&&> FFI.String.withConstPtr
         ---> GioSettingsClass.C.fromPtr true
      )
        newWithBackendAndPath_
        (
          schema
           & backend
           & path
        )
    fun newWithPath schema path = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> GioSettingsClass.C.fromPtr true) newWithPath_ (schema & path)
    fun sync () = (I ---> I) sync_ ()
    fun unbind property = (FFI.String.withConstPtr ---> I) unbind_ property
    fun apply self = (GObjectObjectClass.C.withPtr ---> I) apply_ self
    fun bind self key object property flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
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
         &&&> FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Bool.withVal
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
    fun getBoolean self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) getBoolean_ (self & key)
    fun getChild self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GioSettingsClass.C.fromPtr true) getChild_ (self & name)
    fun getDouble self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Double.fromVal) getDouble_ (self & key)
    fun getEnum self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) getEnum_ (self & key)
    fun getFlags self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.UInt32.fromVal) getFlags_ (self & key)
    fun getHasUnapplied self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHasUnapplied_ self
    fun getInt self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) getInt_ (self & key)
    fun getRange self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GLibVariantRecord.C.fromPtr true) getRange_ (self & key)
    fun getString self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) getString_ (self & key)
    fun getUint self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.UInt32.fromVal) getUint_ (self & key)
    fun getValue self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GLibVariantRecord.C.fromPtr true) getValue_ (self & key)
    fun isWritable self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) isWritable_ (self & name)
    fun rangeCheck self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> FFI.Bool.fromVal
      )
        rangeCheck_
        (
          self
           & key
           & value
        )
    fun reset self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) reset_ (self & key)
    fun revert self = (GObjectObjectClass.C.withPtr ---> I) revert_ self
    fun setBoolean self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Bool.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Double.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.UInt32.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.UInt32.withVal
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> FFI.Bool.fromVal
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
