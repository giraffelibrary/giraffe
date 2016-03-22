structure GtkAccelGroup :>
  GTK_ACCEL_GROUP
    where type 'a class = 'a GtkAccelGroupClass.class
    where type accel_flags_t = GtkAccelFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_accel_group_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_accel_group_new") (FFI.PolyML.cVoid --> GtkAccelGroupClass.PolyML.cPtr)
      val fromAccelClosure_ = call (load_sym libgtk "gtk_accel_group_from_accel_closure") (GObjectClosureRecord.PolyML.cPtr --> GtkAccelGroupClass.PolyML.cPtr)
      val activate_ =
        call (load_sym libgtk "gtk_accel_group_activate")
          (
            GtkAccelGroupClass.PolyML.cPtr
             &&> GLibQuark.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val connect_ =
        call (load_sym libgtk "gtk_accel_group_connect")
          (
            GtkAccelGroupClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> GtkAccelFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val connectByPath_ =
        call (load_sym libgtk "gtk_accel_group_connect_by_path")
          (
            GtkAccelGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectClosureRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val disconnect_ = call (load_sym libgtk "gtk_accel_group_disconnect") (GtkAccelGroupClass.PolyML.cPtr &&> GObjectClosureRecord.PolyML.cOptPtr --> FFI.Bool.PolyML.cVal)
      val disconnectKey_ =
        call (load_sym libgtk "gtk_accel_group_disconnect_key")
          (
            GtkAccelGroupClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val getIsLocked_ = call (load_sym libgtk "gtk_accel_group_get_is_locked") (GtkAccelGroupClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getModifierMask_ = call (load_sym libgtk "gtk_accel_group_get_modifier_mask") (GtkAccelGroupClass.PolyML.cPtr --> GdkModifierType.PolyML.cVal)
      val lock_ = call (load_sym libgtk "gtk_accel_group_lock") (GtkAccelGroupClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unlock_ = call (load_sym libgtk "gtk_accel_group_unlock") (GtkAccelGroupClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkAccelGroupClass.class
    type accel_flags_t = GtkAccelFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAccelGroupClass.C.fromPtr true) new_ ()
    fun fromAccelClosure closure = (GObjectClosureRecord.C.withPtr ---> GtkAccelGroupClass.C.fromPtr false) fromAccelClosure_ closure
    fun activate self accelQuark acceleratable accelKey accelMods =
      (
        GtkAccelGroupClass.C.withPtr
         &&&> GLibQuark.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.C.fromVal
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
        GtkAccelGroupClass.C.withPtr
         &&&> FFI.UInt.C.withVal
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
        GtkAccelGroupClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectClosureRecord.C.withPtr
         ---> I
      )
        connectByPath_
        (
          self
           & accelPath
           & closure
        )
    fun disconnect self closure = (GtkAccelGroupClass.C.withPtr &&&> GObjectClosureRecord.C.withOptPtr ---> FFI.Bool.C.fromVal) disconnect_ (self & closure)
    fun disconnectKey self accelKey accelMods =
      (
        GtkAccelGroupClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        disconnectKey_
        (
          self
           & accelKey
           & accelMods
        )
    fun getIsLocked self = (GtkAccelGroupClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsLocked_ self
    fun getModifierMask self = (GtkAccelGroupClass.C.withPtr ---> GdkModifierType.C.fromVal) getModifierMask_ self
    fun lock self = (GtkAccelGroupClass.C.withPtr ---> I) lock_ self
    fun unlock self = (GtkAccelGroupClass.C.withPtr ---> I) unlock_ self
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
