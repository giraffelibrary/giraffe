structure GtkAccelGroup :>
  GTK_ACCEL_GROUP
    where type 'a class_t = 'a GtkAccelGroupClass.t
    where type accelflags_t = GtkAccelFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_accel_group_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_accel_group_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val fromAccelClosure_ = call (load_sym libgtk "gtk_accel_group_from_accel_closure") (GObjectClosureRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val activate_ =
        call (load_sym libgtk "gtk_accel_group_activate")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GdkModifierType.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val connect_ =
        call (load_sym libgtk "gtk_accel_group_connect")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GdkModifierType.PolyML.VAL
             &&> GtkAccelFlags.PolyML.VAL
             &&> GObjectClosureRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val connectByPath_ =
        call (load_sym libgtk "gtk_accel_group_connect_by_path")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectClosureRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val disconnect_ = call (load_sym libgtk "gtk_accel_group_disconnect") (GObjectObjectClass.PolyML.PTR &&> GObjectClosureRecord.PolyML.OPTPTR --> FFI.PolyML.Bool.VAL)
      val disconnectKey_ =
        call (load_sym libgtk "gtk_accel_group_disconnect_key")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GdkModifierType.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val getIsLocked_ = call (load_sym libgtk "gtk_accel_group_get_is_locked") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getModifierMask_ = call (load_sym libgtk "gtk_accel_group_get_modifier_mask") (GObjectObjectClass.PolyML.PTR --> GdkModifierType.PolyML.VAL)
      val lock_ = call (load_sym libgtk "gtk_accel_group_lock") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unlock_ = call (load_sym libgtk "gtk_accel_group_unlock") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAccelGroupClass.t
    type accelflags_t = GtkAccelFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAccelGroupClass.C.fromPtr true) new_ ()
    fun fromAccelClosure closure = (GObjectClosureRecord.C.withPtr ---> GtkAccelGroupClass.C.fromPtr false) fromAccelClosure_ closure
    fun activate self accelQuark acceleratable accelKey accelMods =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.fromVal
      )
        activate_
        (
          self
           & accelQuark
           & acceleratable
           & accelKey
           & accelMods
        )
    fun connect self accelKey accelMods accelFlags closure =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> GdkModifierType.C.withVal
         &&&> GtkAccelFlags.C.withVal
         &&&> GObjectClosureRecord.C.withPtr
         ---> I
      )
        connect_
        (
          self
           & accelKey
           & accelMods
           & accelFlags
           & closure
        )
    fun connectByPath self accelPath closure =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectClosureRecord.C.withPtr
         ---> I
      )
        connectByPath_
        (
          self
           & accelPath
           & closure
        )
    fun disconnect self closure = (GObjectObjectClass.C.withPtr &&&> GObjectClosureRecord.C.withOptPtr ---> FFI.Bool.fromVal) disconnect_ (self & closure)
    fun disconnectKey self accelKey accelMods =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.fromVal
      )
        disconnectKey_
        (
          self
           & accelKey
           & accelMods
        )
    fun getIsLocked self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsLocked_ self
    fun getModifierMask self = (GObjectObjectClass.C.withPtr ---> GdkModifierType.C.fromVal) getModifierMask_ self
    fun lock self = (GObjectObjectClass.C.withPtr ---> I) lock_ self
    fun unlock self = (GObjectObjectClass.C.withPtr ---> I) unlock_ self
    local
      open ClosureMarshal Signal
    in
      fun accelActivateSig f =
        signal "accel-activate"
          (
            get 0w1 GObjectObjectClass.t
             &&&> get 0w2 uint
             &&&> get 0w3 GdkModifierType.t
             ---> ret boolean
          )
          (
            fn
              acceleratable
               & keyval
               & modifier =>
                f acceleratable keyval modifier
          )
      fun accelChangedSig f =
        signal "accel-changed"
          (
            get 0w1 uint
             &&&> get 0w2 GdkModifierType.t
             &&&> get 0w3 GObjectClosureRecord.t
             ---> ret_void
          )
          (
            fn
              keyval
               & modifier
               & accelClosure =>
                f keyval modifier accelClosure
          )
    end
    local
      open Property
    in
      val isLockedProp = {get = fn x => get "is-locked" boolean x}
      val modifierMaskProp = {get = fn x => get "modifier-mask" GdkModifierType.t x}
    end
  end
