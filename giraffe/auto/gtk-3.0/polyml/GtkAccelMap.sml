structure GtkAccelMap :>
  GTK_ACCEL_MAP
    where type 'a class_t = 'a GtkAccelMapClass.t
    where type accelkeyrecord_t = GtkAccelKeyRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_accel_map_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addEntry_ =
        call (load_sym libgtk "gtk_accel_map_add_entry")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.UInt.PolyML.VAL
             &&> GdkModifierType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val addFilter_ = call (load_sym libgtk "gtk_accel_map_add_filter") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val changeEntry_ =
        call (load_sym libgtk "gtk_accel_map_change_entry")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.UInt.PolyML.VAL
             &&> GdkModifierType.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val get_ = call (load_sym libgtk "gtk_accel_map_get") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val load_ = call (load_sym libgtk "gtk_accel_map_load") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val loadFd_ = call (load_sym libgtk "gtk_accel_map_load_fd") (FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val lockPath_ = call (load_sym libgtk "gtk_accel_map_lock_path") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val lookupEntry_ = call (load_sym libgtk "gtk_accel_map_lookup_entry") (FFI.String.PolyML.INPTR &&> GtkAccelKeyRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val save_ = call (load_sym libgtk "gtk_accel_map_save") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val saveFd_ = call (load_sym libgtk "gtk_accel_map_save_fd") (FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val unlockPath_ = call (load_sym libgtk "gtk_accel_map_unlock_path") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAccelMapClass.t
    type accelkeyrecord_t = GtkAccelKeyRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addEntry accelPath accelKey accelMods =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.UInt.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> I
      )
        addEntry_
        (
          accelPath
           & accelKey
           & accelMods
        )
    fun addFilter filterPattern = (FFI.String.C.withConstPtr ---> I) addFilter_ filterPattern
    fun changeEntry accelPath accelKey accelMods replace =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.UInt.C.withVal
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
    fun load fileName = (FFI.String.C.withConstPtr ---> I) load_ fileName
    fun loadFd fd = (FFI.Int.C.withVal ---> I) loadFd_ fd
    fun lockPath accelPath = (FFI.String.C.withConstPtr ---> I) lockPath_ accelPath
    fun lookupEntry accelPath =
      let
        val key & retVal = (FFI.String.C.withConstPtr &&&> GtkAccelKeyRecord.C.withNewPtr ---> GtkAccelKeyRecord.C.fromPtr true && FFI.Bool.C.fromVal) lookupEntry_ (accelPath & ())
      in
        if retVal then SOME key else NONE
      end
    fun save fileName = (FFI.String.C.withConstPtr ---> I) save_ fileName
    fun saveFd fd = (FFI.Int.C.withVal ---> I) saveFd_ fd
    fun unlockPath accelPath = (FFI.String.C.withConstPtr ---> I) unlockPath_ accelPath
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