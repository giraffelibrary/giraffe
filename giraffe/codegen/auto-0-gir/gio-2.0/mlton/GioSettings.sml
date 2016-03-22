structure GioSettings :>
  GIO_SETTINGS
    where type 'a class = 'a GioSettingsClass.class
    where type settings_backend_t = GioSettingsBackendRecord.t
    where type settings_bind_flags_t = GioSettingsBindFlags.t =
  struct
    val getType_ = _import "g_settings_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_settings_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioSettingsClass.C.notnull GioSettingsClass.C.p;
    val newWithBackend_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_settings_new_with_backend" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioSettingsBackendRecord.C.notnull GioSettingsBackendRecord.C.p
               -> GioSettingsClass.C.notnull GioSettingsClass.C.p;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * GioSettingsBackendRecord.C.notnull GioSettingsBackendRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioSettingsClass.C.notnull GioSettingsClass.C.p;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioSettingsClass.C.notnull GioSettingsClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val sync_ = _import "g_settings_sync" : unit -> unit;
    val apply_ = _import "g_settings_apply" : GioSettingsClass.C.notnull GioSettingsClass.C.p -> unit;
    val bind_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_settings_bind" :
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Bool.C.val_
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
    val delay_ = _import "g_settings_delay" : GioSettingsClass.C.notnull GioSettingsClass.C.p -> unit;
    val getBoolean_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_boolean" :
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioSettingsClass.C.notnull GioSettingsClass.C.p;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Double.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Int.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getHasUnapplied_ = _import "g_settings_get_has_unapplied" : GioSettingsClass.C.notnull GioSettingsClass.C.p -> FFI.Bool.C.val_;
    val getInt_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_settings_get_int" :
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Int.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.UInt.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val revert_ = _import "g_settings_revert" : GioSettingsClass.C.notnull GioSettingsClass.C.p -> unit;
    val setBoolean_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_settings_set_boolean" :
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Double.C.val_
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt.C.val_
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt.C.val_
               -> FFI.Bool.C.val_;
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
              GioSettingsClass.C.notnull GioSettingsClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
               -> FFI.Bool.C.val_;
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
