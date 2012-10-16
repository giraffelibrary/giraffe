structure GtkAccelMap :>
  GTK_ACCEL_MAP
    where type 'a class_t = 'a GtkAccelMapClass.t
    where type accelkeyrecord_t = GtkAccelKeyRecord.t =
  struct
    val getType_ = _import "gtk_accel_map_get_type" : unit -> GObjectType.C.val_;
    val addEntry_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_accel_map_add_entry" :
              cstring
               * unit CPointer.t
               * FFI.Word32.val_
               * GdkModifierType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addFilter_ = _import "mlton_gtk_accel_map_add_filter" : cstring * unit CPointer.t -> unit;
    val changeEntry_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_gtk_accel_map_change_entry" :
              cstring
               * unit CPointer.t
               * FFI.Word32.val_
               * GdkModifierType.C.val_
               * FFI.Bool.val_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val get_ = _import "gtk_accel_map_get" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val load_ = _import "mlton_gtk_accel_map_load" : cstring * unit CPointer.t -> unit;
    val loadFd_ = _import "gtk_accel_map_load_fd" : FFI.Int32.val_ -> unit;
    val lockPath_ = _import "mlton_gtk_accel_map_lock_path" : cstring * unit CPointer.t -> unit;
    val lookupEntry_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_accel_map_lookup_entry" :
              cstring
               * unit CPointer.t
               * GtkAccelKeyRecord.C.notnull GtkAccelKeyRecord.C.p
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val save_ = _import "mlton_gtk_accel_map_save" : cstring * unit CPointer.t -> unit;
    val saveFd_ = _import "gtk_accel_map_save_fd" : FFI.Int32.val_ -> unit;
    val unlockPath_ = _import "mlton_gtk_accel_map_unlock_path" : cstring * unit CPointer.t -> unit;
    type 'a class_t = 'a GtkAccelMapClass.t
    type accelkeyrecord_t = GtkAccelKeyRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addEntry accelPath accelKey accelMods =
      (
        FFI.String.withConstPtr
         &&&> FFI.Word32.withVal
         &&&> GdkModifierType.C.withVal
         ---> I
      )
        addEntry_
        (
          accelPath
           & accelKey
           & accelMods
        )
    fun addFilter filterPattern = (FFI.String.withConstPtr ---> I) addFilter_ filterPattern
    fun changeEntry accelPath accelKey accelMods replace =
      (
        FFI.String.withConstPtr
         &&&> FFI.Word32.withVal
         &&&> GdkModifierType.C.withVal
         &&&> FFI.Bool.withVal
         ---> FFI.Bool.fromVal
      )
        changeEntry_
        (
          accelPath
           & accelKey
           & accelMods
           & replace
        )
    fun get () = (I ---> GtkAccelMapClass.C.fromPtr false) get_ ()
    fun load fileName = (FFI.String.withConstPtr ---> I) load_ fileName
    fun loadFd fd = (FFI.Int32.withVal ---> I) loadFd_ fd
    fun lockPath accelPath = (FFI.String.withConstPtr ---> I) lockPath_ accelPath
    fun lookupEntry accelPath =
      let
        val key & retVal = (FFI.String.withConstPtr &&&> GtkAccelKeyRecord.C.withNewPtr ---> GtkAccelKeyRecord.C.fromPtr true && FFI.Bool.fromVal) lookupEntry_ (accelPath & ())
      in
        if retVal then SOME key else NONE
      end
    fun save fileName = (FFI.String.withConstPtr ---> I) save_ fileName
    fun saveFd fd = (FFI.Int32.withVal ---> I) saveFd_ fd
    fun unlockPath accelPath = (FFI.String.withConstPtr ---> I) unlockPath_ accelPath
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
