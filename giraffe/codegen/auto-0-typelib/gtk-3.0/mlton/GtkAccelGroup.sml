structure GtkAccelGroup :>
  GTK_ACCEL_GROUP
    where type 'a class = 'a GtkAccelGroupClass.class
    where type accel_flags_t = GtkAccelFlags.t =
  struct
    val getType_ = _import "gtk_accel_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_accel_group_new" : unit -> GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p;
    val fromAccelClosure_ = _import "gtk_accel_group_from_accel_closure" : GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p -> GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p;
    val activate_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_accel_group_activate" :
              GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p
               * FFI.UInt32.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               -> FFI.Bool.C.val_;
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
              GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               * GtkAccelFlags.C.val_
               * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p
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
              GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val disconnect_ = fn x1 & x2 => (_import "gtk_accel_group_disconnect" : GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p * unit GObjectClosureRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val disconnectKey_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_accel_group_disconnect_key" :
              GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIsLocked_ = _import "gtk_accel_group_get_is_locked" : GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p -> FFI.Bool.C.val_;
    val getModifierMask_ = _import "gtk_accel_group_get_modifier_mask" : GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p -> GdkModifierType.C.val_;
    val lock_ = _import "gtk_accel_group_lock" : GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p -> unit;
    val unlock_ = _import "gtk_accel_group_unlock" : GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p -> unit;
    type 'a class = 'a GtkAccelGroupClass.class
    type accel_flags_t = GtkAccelFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAccelGroupClass.C.fromPtr true) new_ ()
    fun fromAccelClosure closure = (GObjectClosureRecord.C.withPtr ---> GtkAccelGroupClass.C.fromPtr false) fromAccelClosure_ closure
    fun activate self accelQuark acceleratable accelKey accelMods =
      (
        GtkAccelGroupClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
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
         &&&> FFI.UInt32.C.withVal
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
         &&&> FFI.UInt32.C.withVal
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
