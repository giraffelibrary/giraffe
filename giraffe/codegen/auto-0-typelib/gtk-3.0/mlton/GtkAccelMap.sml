structure GtkAccelMap :>
  GTK_ACCEL_MAP
    where type 'a class = 'a GtkAccelMapClass.class
    where type accel_key_t = GtkAccelKeyRecord.t =
  struct
    val getType_ = _import "gtk_accel_map_get_type" : unit -> GObjectType.C.val_;
    val addEntry_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_accel_map_add_entry" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addFilter_ = _import "mlton_gtk_accel_map_add_filter" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val changeEntry_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_gtk_accel_map_change_entry" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val get_ = _import "gtk_accel_map_get" : unit -> GtkAccelMapClass.C.notnull GtkAccelMapClass.C.p;
    val load_ = _import "mlton_gtk_accel_map_load" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val loadFd_ = _import "gtk_accel_map_load_fd" : FFI.Int32.C.val_ -> unit;
    val lockPath_ = _import "mlton_gtk_accel_map_lock_path" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val lookupEntry_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_accel_map_lookup_entry" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkAccelKeyRecord.C.notnull GtkAccelKeyRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val save_ = _import "mlton_gtk_accel_map_save" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val saveFd_ = _import "gtk_accel_map_save_fd" : FFI.Int32.C.val_ -> unit;
    val unlockPath_ = _import "mlton_gtk_accel_map_unlock_path" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    type 'a class = 'a GtkAccelMapClass.class
    type accel_key_t = GtkAccelKeyRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addEntry accelPath accelKey accelMods =
      (
        Utf8.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> I
      )
        addEntry_
        (
          accelPath
           & accelKey
           & accelMods
        )
    fun addFilter filterPattern = (Utf8.C.withPtr ---> I) addFilter_ filterPattern
    fun changeEntry accelPath accelKey accelMods replace =
      (
        Utf8.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GdkModifierType.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        changeEntry_
        (
          accelPath
           & accelKey
           & accelMods
           & replace
        )
    fun get () = (I ---> GtkAccelMapClass.C.fromPtr false) get_ ()
    fun load fileName = (Utf8.C.withPtr ---> I) load_ fileName
    fun loadFd fd = (FFI.Int32.C.withVal ---> I) loadFd_ fd
    fun lockPath accelPath = (Utf8.C.withPtr ---> I) lockPath_ accelPath
    fun lookupEntry accelPath =
      let
        val key & retVal = (Utf8.C.withPtr &&&> GtkAccelKeyRecord.C.withNewPtr ---> GtkAccelKeyRecord.C.fromPtr true && FFI.Bool.C.fromVal) lookupEntry_ (accelPath & ())
      in
        if retVal then SOME key else NONE
      end
    fun save fileName = (Utf8.C.withPtr ---> I) save_ fileName
    fun saveFd fd = (FFI.Int32.C.withVal ---> I) saveFd_ fd
    fun unlockPath accelPath = (Utf8.C.withPtr ---> I) unlockPath_ accelPath
    local
      open ClosureMarshal Signal
    in
      fun changedSig f =
        signal "changed"
          (
            get 0w1 string
             &&&> get 0w2 uint
             &&&> get 0w3 GdkModifierType.t
             ---> ret_void
          )
          (
            fn
              accelPath
               & accelKey
               & accelMods =>
                f accelPath accelKey accelMods
          )
    end
  end
