structure GtkAccelMap :>
  GTK_ACCEL_MAP
    where type 'a class = 'a GtkAccelMapClass.class
    where type accel_key_t = GtkAccelKeyRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_accel_map_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addEntry_ =
        call (getSymbol "gtk_accel_map_add_entry")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> cVoid
          )
      val addFilter_ = call (getSymbol "gtk_accel_map_add_filter") (Utf8.PolyML.cInPtr --> cVoid)
      val changeEntry_ =
        call (getSymbol "gtk_accel_map_change_entry")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val get_ = call (getSymbol "gtk_accel_map_get") (cVoid --> GtkAccelMapClass.PolyML.cPtr)
      val load_ = call (getSymbol "gtk_accel_map_load") (Utf8.PolyML.cInPtr --> cVoid)
      val loadFd_ = call (getSymbol "gtk_accel_map_load_fd") (GInt32.PolyML.cVal --> cVoid)
      val lockPath_ = call (getSymbol "gtk_accel_map_lock_path") (Utf8.PolyML.cInPtr --> cVoid)
      val lookupEntry_ = call (getSymbol "gtk_accel_map_lookup_entry") (Utf8.PolyML.cInPtr &&> GtkAccelKeyRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val save_ = call (getSymbol "gtk_accel_map_save") (Utf8.PolyML.cInPtr --> cVoid)
      val saveFd_ = call (getSymbol "gtk_accel_map_save_fd") (GInt32.PolyML.cVal --> cVoid)
      val unlockPath_ = call (getSymbol "gtk_accel_map_unlock_path") (Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkAccelMapClass.class
    type accel_key_t = GtkAccelKeyRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addEntry accelPath accelKey accelMods =
      (
        Utf8.FFI.withPtr
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
    fun addFilter filterPattern = (Utf8.FFI.withPtr ---> I) addFilter_ filterPattern
    fun changeEntry accelPath accelKey accelMods replace =
      (
        Utf8.FFI.withPtr
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
    fun load fileName = (Utf8.FFI.withPtr ---> I) load_ fileName
    fun loadFd fd = (GInt32.FFI.withVal ---> I) loadFd_ fd
    fun lockPath accelPath = (Utf8.FFI.withPtr ---> I) lockPath_ accelPath
    fun lookupEntry accelPath =
      let
        val key & retVal = (Utf8.FFI.withPtr &&&> GtkAccelKeyRecord.FFI.withNewPtr ---> GtkAccelKeyRecord.FFI.fromPtr true && GBool.FFI.fromVal) lookupEntry_ (accelPath & ())
      in
        if retVal then SOME key else NONE
      end
    fun save fileName = (Utf8.FFI.withPtr ---> I) save_ fileName
    fun saveFd fd = (GInt32.FFI.withVal ---> I) saveFd_ fd
    fun unlockPath accelPath = (Utf8.FFI.withPtr ---> I) unlockPath_ accelPath
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
