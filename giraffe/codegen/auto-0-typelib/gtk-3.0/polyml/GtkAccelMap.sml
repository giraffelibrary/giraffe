structure GtkAccelMap :>
  GTK_ACCEL_MAP
    where type 'a class = 'a GtkAccelMapClass.class
    where type accel_key_t = GtkAccelKeyRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_accel_map_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val addEntry_ =
        call (load_sym libgtk "gtk_accel_map_add_entry")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val addFilter_ = call (load_sym libgtk "gtk_accel_map_add_filter") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val changeEntry_ =
        call (load_sym libgtk "gtk_accel_map_change_entry")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val get_ = call (load_sym libgtk "gtk_accel_map_get") (FFI.PolyML.cVoid --> GtkAccelMapClass.PolyML.cPtr)
      val load_ = call (load_sym libgtk "gtk_accel_map_load") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val loadFd_ = call (load_sym libgtk "gtk_accel_map_load_fd") (FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val lockPath_ = call (load_sym libgtk "gtk_accel_map_lock_path") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val lookupEntry_ = call (load_sym libgtk "gtk_accel_map_lookup_entry") (Utf8.PolyML.cInPtr &&> GtkAccelKeyRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val save_ = call (load_sym libgtk "gtk_accel_map_save") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val saveFd_ = call (load_sym libgtk "gtk_accel_map_save_fd") (FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val unlockPath_ = call (load_sym libgtk "gtk_accel_map_unlock_path") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
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
