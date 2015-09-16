structure GioMount :>
  GIO_MOUNT
    where type 'a class_t = 'a GioMountClass.t
    where type 'a drive_class_t = 'a GioDriveClass.t
    where type 'a icon_class_t = 'a GioIconClass.t
    where type 'a file_class_t = 'a GioFileClass.t
    where type 'a volume_class_t = 'a GioVolumeClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_mount_get_type" : unit -> GObjectType.C.val_;
    val canEject_ = _import "g_mount_can_eject" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val canUnmount_ = _import "g_mount_can_unmount" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val ejectWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_eject_with_operation_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultLocation_ = _import "g_mount_get_default_location" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDrive_ = _import "g_mount_get_drive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIcon_ = _import "g_mount_get_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getName_ = _import "g_mount_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getRoot_ = _import "g_mount_get_root" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getUuid_ = _import "g_mount_get_uuid" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getVolume_ = _import "g_mount_get_volume" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val isShadowed_ = _import "g_mount_is_shadowed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val remountFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_remount_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val shadow_ = _import "g_mount_shadow" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unmountWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_unmount_with_operation_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unshadow_ = _import "g_mount_unshadow" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GioMountClass.t
    type 'a drive_class_t = 'a GioDriveClass.t
    type 'a icon_class_t = 'a GioIconClass.t
    type 'a file_class_t = 'a GioFileClass.t
    type 'a volume_class_t = 'a GioVolumeClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canUnmount self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canUnmount_ self
    fun ejectWithOperationFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        ejectWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun getDefaultLocation self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getDefaultLocation_ self
    fun getDrive self = (GObjectObjectClass.C.withPtr ---> GioDriveClass.C.fromPtr true) getDrive_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getName_ self
    fun getRoot self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getRoot_ self
    fun getUuid self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getUuid_ self
    fun getVolume self = (GObjectObjectClass.C.withPtr ---> GioVolumeClass.C.fromPtr true) getVolume_ self
    fun isShadowed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isShadowed_ self
    fun remountFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        remountFinish_
        (
          self
           & result
           & []
        )
    fun shadow self = (GObjectObjectClass.C.withPtr ---> I) shadow_ self
    fun unmountWithOperationFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        unmountWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun unshadow self = (GObjectObjectClass.C.withPtr ---> I) unshadow_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun preUnmountSig f = signal "pre-unmount" (void ---> ret_void) f
      fun unmountedSig f = signal "unmounted" (void ---> ret_void) f
    end
  end
