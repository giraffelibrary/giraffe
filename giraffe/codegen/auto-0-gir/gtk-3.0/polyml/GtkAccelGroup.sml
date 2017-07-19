structure GtkAccelGroup :>
  GTK_ACCEL_GROUP
    where type 'a class = 'a GtkAccelGroupClass.class
    where type accel_flags_t = GtkAccelFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_accel_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_accel_group_new") (cVoid --> GtkAccelGroupClass.PolyML.cPtr)
      val fromAccelClosure_ = call (getSymbol "gtk_accel_group_from_accel_closure") (GObjectClosureRecord.PolyML.cPtr --> GtkAccelGroupClass.PolyML.cPtr)
      val activate_ =
        call (getSymbol "gtk_accel_group_activate")
          (
            GtkAccelGroupClass.PolyML.cPtr
             &&> GLibQuark.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val connect_ =
        call (getSymbol "gtk_accel_group_connect")
          (
            GtkAccelGroupClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> GtkAccelFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cPtr
             --> cVoid
          )
      val connectByPath_ =
        call (getSymbol "gtk_accel_group_connect_by_path")
          (
            GtkAccelGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectClosureRecord.PolyML.cPtr
             --> cVoid
          )
      val disconnect_ = call (getSymbol "gtk_accel_group_disconnect") (GtkAccelGroupClass.PolyML.cPtr &&> GObjectClosureRecord.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val disconnectKey_ =
        call (getSymbol "gtk_accel_group_disconnect_key")
          (
            GtkAccelGroupClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val getIsLocked_ = call (getSymbol "gtk_accel_group_get_is_locked") (GtkAccelGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getModifierMask_ = call (getSymbol "gtk_accel_group_get_modifier_mask") (GtkAccelGroupClass.PolyML.cPtr --> GdkModifierType.PolyML.cVal)
      val lock_ = call (getSymbol "gtk_accel_group_lock") (GtkAccelGroupClass.PolyML.cPtr --> cVoid)
      val unlock_ = call (getSymbol "gtk_accel_group_unlock") (GtkAccelGroupClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkAccelGroupClass.class
    type accel_flags_t = GtkAccelFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkAccelGroupClass.FFI.fromPtr true) new_ ()
    fun fromAccelClosure closure = (GObjectClosureRecord.FFI.withPtr ---> GtkAccelGroupClass.FFI.fromPtr false) fromAccelClosure_ closure
    fun activate
      self
      (
        accelQuark,
        acceleratable,
        accelKey,
        accelMods
      ) =
      (
        GtkAccelGroupClass.FFI.withPtr
         &&&> GLibQuark.FFI.withVal
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        activate_
        (
          self
           & accelQuark
           & acceleratable
           & accelKey
           & accelMods
        )
    fun connect
      self
      (
        accelKey,
        accelMods,
        accelFlags,
        closure
      ) =
      (
        GtkAccelGroupClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         &&&> GtkAccelFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withPtr
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
    fun connectByPath self (accelPath, closure) =
      (
        GtkAccelGroupClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectClosureRecord.FFI.withPtr
         ---> I
      )
        connectByPath_
        (
          self
           & accelPath
           & closure
        )
    fun disconnect self closure = (GtkAccelGroupClass.FFI.withPtr &&&> GObjectClosureRecord.FFI.withOptPtr ---> GBool.FFI.fromVal) disconnect_ (self & closure)
    fun disconnectKey self (accelKey, accelMods) =
      (
        GtkAccelGroupClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        disconnectKey_
        (
          self
           & accelKey
           & accelMods
        )
    fun getIsLocked self = (GtkAccelGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsLocked_ self
    fun getModifierMask self = (GtkAccelGroupClass.FFI.withPtr ---> GdkModifierType.FFI.fromVal) getModifierMask_ self
    fun lock self = (GtkAccelGroupClass.FFI.withPtr ---> I) lock_ self
    fun unlock self = (GtkAccelGroupClass.FFI.withPtr ---> I) unlock_ self
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
                f
                  (
                    acceleratable,
                    keyval,
                    modifier
                  )
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
                f
                  (
                    keyval,
                    modifier,
                    accelClosure
                  )
          )
    end
    local
      open Property
    in
      val isLockedProp = {get = fn x => get "is-locked" boolean x}
      val modifierMaskProp = {get = fn x => get "modifier-mask" GdkModifierType.t x}
    end
  end
