structure GtkAccelGroup :>
  GTK_ACCEL_GROUP
    where type 'a class = 'a GtkAccelGroupClass.class
    where type accel_flags_t = GtkAccelFlags.t
    where type accel_group_entry_record_c_array_n_t = GtkAccelGroupEntryRecordCArrayN.t =
  struct
    val getType_ = _import "gtk_accel_group_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_accel_group_new" : unit -> GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p;
    val fromAccelClosure_ = _import "gtk_accel_group_from_accel_closure" : GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p -> GtkAccelGroupClass.FFI.opt GtkAccelGroupClass.FFI.p;
    val activate_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_accel_group_activate" :
              GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p
               * GUInt32.FFI.val_
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * GUInt32.FFI.val_
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
              GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               * GtkAccelFlags.FFI.val_
               * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
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
              GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val disconnect_ = fn x1 & x2 => (_import "gtk_accel_group_disconnect" : GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p * GObjectClosureRecord.FFI.opt GObjectClosureRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val disconnectKey_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_accel_group_disconnect_key" :
              GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIsLocked_ = _import "gtk_accel_group_get_is_locked" : GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p -> GBool.FFI.val_;
    val getModifierMask_ = _import "gtk_accel_group_get_modifier_mask" : GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p -> GdkModifierType.FFI.val_;
    val lock_ = _import "gtk_accel_group_lock" : GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p -> unit;
    val query_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_accel_group_query" :
              GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               * GUInt32.FFI.ref_
               -> GtkAccelGroupEntryRecordCArrayN.FFI.opt GtkAccelGroupEntryRecordCArrayN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val unlock_ = _import "gtk_accel_group_unlock" : GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p -> unit;
    type 'a class = 'a GtkAccelGroupClass.class
    type accel_flags_t = GtkAccelFlags.t
    type accel_group_entry_record_c_array_n_t = GtkAccelGroupEntryRecordCArrayN.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkAccelGroupClass.FFI.fromPtr true) new_ ()
    fun fromAccelClosure closure = (GObjectClosureRecord.FFI.withPtr ---> GtkAccelGroupClass.FFI.fromOptPtr false) fromAccelClosure_ closure
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
         &&&> GUInt32.FFI.withVal
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
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
         &&&> GUInt32.FFI.withVal
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
         &&&> GUInt32.FFI.withVal
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
    fun query self (accelKey, accelMods) =
      let
        val nEntries & retVal =
          (
            GtkAccelGroupClass.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             &&&> GdkModifierType.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal && GtkAccelGroupEntryRecordCArrayN.FFI.fromOptPtr 0
          )
            query_
            (
              self
               & accelKey
               & accelMods
               & GUInt32.null
            )
      in
        retVal (LargeInt.toInt nEntries)
      end
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
