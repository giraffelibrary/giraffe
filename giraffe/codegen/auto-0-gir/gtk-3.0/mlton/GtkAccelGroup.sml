structure GtkAccelGroup :>
  GTK_ACCEL_GROUP
    where type 'a class = 'a GtkAccelGroupClass.class
    where type accel_flags_t = GtkAccelFlags.t =
  struct
    val getType_ = _import "gtk_accel_group_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_accel_group_new" : unit -> GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p;
    val fromAccelClosure_ = _import "gtk_accel_group_from_accel_closure" : GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p -> GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p;
    val activate_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_accel_group_activate" :
              GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p
               * GLibQuark.FFI.val_
               * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * GUInt.FFI.val_
               * GdkModifierType.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val connect_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_accel_group_connect" :
              GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p
               * GUInt.FFI.val_
               * GdkModifierType.FFI.val_
               * GtkAccelFlags.FFI.val_
               * GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val connectByPath_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_accel_group_connect_by_path" :
              GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectClosureRecord.FFI.notnull GObjectClosureRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val disconnect_ = fn x1 & x2 => (_import "gtk_accel_group_disconnect" : GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p * unit GObjectClosureRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val disconnectKey_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_accel_group_disconnect_key" :
              GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p
               * GUInt.FFI.val_
               * GdkModifierType.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIsLocked_ = _import "gtk_accel_group_get_is_locked" : GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p -> GBool.FFI.val_;
    val getModifierMask_ = _import "gtk_accel_group_get_modifier_mask" : GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p -> GdkModifierType.FFI.val_;
    val lock_ = _import "gtk_accel_group_lock" : GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p -> unit;
    val unlock_ = _import "gtk_accel_group_unlock" : GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p -> unit;
    type 'a class = 'a GtkAccelGroupClass.class
    type accel_flags_t = GtkAccelFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkAccelGroupClass.FFI.fromPtr true) new_ ()
    fun fromAccelClosure closure = (GObjectClosureRecord.FFI.withPtr ---> GtkAccelGroupClass.FFI.fromPtr false) fromAccelClosure_ closure
    fun activate self accelQuark acceleratable accelKey accelMods =
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
    fun connect self accelKey accelMods accelFlags closure =
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
    fun connectByPath self accelPath closure =
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
    fun disconnectKey self accelKey accelMods =
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
