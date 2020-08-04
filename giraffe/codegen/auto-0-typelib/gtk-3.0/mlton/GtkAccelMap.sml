structure GtkAccelMap :>
  GTK_ACCEL_MAP
    where type 'a class = 'a GtkAccelMapClass.class
    where type accel_key_t = GtkAccelKeyRecord.t =
  struct
    val getType_ = _import "gtk_accel_map_get_type" : unit -> GObjectType.FFI.val_;
    val addEntry_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_accel_map_add_entry" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addFilter_ = _import "mlton_gtk_accel_map_add_filter" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val changeEntry_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_gtk_accel_map_change_entry" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val get_ = _import "gtk_accel_map_get" : unit -> GtkAccelMapClass.FFI.non_opt GtkAccelMapClass.FFI.p;
    val load_ = _import "mlton_gtk_accel_map_load" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val loadFd_ = _import "gtk_accel_map_load_fd" : GInt32.FFI.val_ -> unit;
    val lockPath_ = _import "mlton_gtk_accel_map_lock_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val lookupEntry_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_accel_map_lookup_entry" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkAccelKeyRecord.FFI.non_opt GtkAccelKeyRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val save_ = _import "mlton_gtk_accel_map_save" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val saveFd_ = _import "gtk_accel_map_save_fd" : GInt32.FFI.val_ -> unit;
    val unlockPath_ = _import "mlton_gtk_accel_map_unlock_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    type 'a class = 'a GtkAccelMapClass.class
    type accel_key_t = GtkAccelKeyRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addEntry
      (
        accelPath,
        accelKey,
        accelMods
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> I
      )
        addEntry_
        (
          accelPath
           & accelKey
           & accelMods
        )
    fun addFilter filterPattern = (Utf8.FFI.withPtr 0 ---> I) addFilter_ filterPattern
    fun changeEntry
      (
        accelPath,
        accelKey,
        accelMods,
        replace
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        changeEntry_
        (
          accelPath
           & accelKey
           & accelMods
           & replace
        )
    fun get () = (I ---> GtkAccelMapClass.FFI.fromPtr false) get_ ()
    fun load fileName = (Utf8.FFI.withPtr 0 ---> I) load_ fileName
    fun loadFd fd = (GInt32.FFI.withVal ---> I) loadFd_ fd
    fun lockPath accelPath = (Utf8.FFI.withPtr 0 ---> I) lockPath_ accelPath
    fun lookupEntry accelPath =
      let
        val key & retVal = (Utf8.FFI.withPtr 0 &&&> GtkAccelKeyRecord.FFI.withNewPtr ---> GtkAccelKeyRecord.FFI.fromPtr true && GBool.FFI.fromVal) lookupEntry_ (accelPath & ())
      in
        if retVal then SOME key else NONE
      end
    fun save fileName = (Utf8.FFI.withPtr 0 ---> I) save_ fileName
    fun saveFd fd = (GInt32.FFI.withVal ---> I) saveFd_ fd
    fun unlockPath accelPath = (Utf8.FFI.withPtr 0 ---> I) unlockPath_ accelPath
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
                f
                  (
                    accelPath,
                    accelKey,
                    accelMods
                  )
          )
    end
  end
