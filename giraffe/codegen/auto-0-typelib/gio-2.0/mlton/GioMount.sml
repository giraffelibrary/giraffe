structure GioMount :>
  GIO_MOUNT
    where type 'a class = 'a GioMountClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a volume_class = 'a GioVolumeClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_mount_get_type" : unit -> GObjectType.C.val_;
    val canEject_ = _import "g_mount_can_eject" : GioMountClass.C.notnull GioMountClass.C.p -> FFI.Bool.C.val_;
    val canUnmount_ = _import "g_mount_can_unmount" : GioMountClass.C.notnull GioMountClass.C.p -> FFI.Bool.C.val_;
    val ejectWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_eject_with_operation_finish" :
              GioMountClass.C.notnull GioMountClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultLocation_ = _import "g_mount_get_default_location" : GioMountClass.C.notnull GioMountClass.C.p -> GioFileClass.C.notnull GioFileClass.C.p;
    val getDrive_ = _import "g_mount_get_drive" : GioMountClass.C.notnull GioMountClass.C.p -> GioDriveClass.C.notnull GioDriveClass.C.p;
    val getIcon_ = _import "g_mount_get_icon" : GioMountClass.C.notnull GioMountClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val getName_ = _import "g_mount_get_name" : GioMountClass.C.notnull GioMountClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getRoot_ = _import "g_mount_get_root" : GioMountClass.C.notnull GioMountClass.C.p -> GioFileClass.C.notnull GioFileClass.C.p;
    val getUuid_ = _import "g_mount_get_uuid" : GioMountClass.C.notnull GioMountClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getVolume_ = _import "g_mount_get_volume" : GioMountClass.C.notnull GioMountClass.C.p -> GioVolumeClass.C.notnull GioVolumeClass.C.p;
    val isShadowed_ = _import "g_mount_is_shadowed" : GioMountClass.C.notnull GioMountClass.C.p -> FFI.Bool.C.val_;
    val remountFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_remount_finish" :
              GioMountClass.C.notnull GioMountClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val shadow_ = _import "g_mount_shadow" : GioMountClass.C.notnull GioMountClass.C.p -> unit;
    val unmountWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_unmount_with_operation_finish" :
              GioMountClass.C.notnull GioMountClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unshadow_ = _import "g_mount_unshadow" : GioMountClass.C.notnull GioMountClass.C.p -> unit;
    type 'a class = 'a GioMountClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a volume_class = 'a GioVolumeClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GioMountClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canUnmount self = (GioMountClass.C.withPtr ---> FFI.Bool.C.fromVal) canUnmount_ self
    fun ejectWithOperationFinish self result =
      (
        GioMountClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        ejectWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun getDefaultLocation self = (GioMountClass.C.withPtr ---> GioFileClass.C.fromPtr true) getDefaultLocation_ self
    fun getDrive self = (GioMountClass.C.withPtr ---> GioDriveClass.C.fromPtr true) getDrive_ self
    fun getIcon self = (GioMountClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getName self = (GioMountClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getRoot self = (GioMountClass.C.withPtr ---> GioFileClass.C.fromPtr true) getRoot_ self
    fun getUuid self = (GioMountClass.C.withPtr ---> Utf8.C.fromPtr true) getUuid_ self
    fun getVolume self = (GioMountClass.C.withPtr ---> GioVolumeClass.C.fromPtr true) getVolume_ self
    fun isShadowed self = (GioMountClass.C.withPtr ---> FFI.Bool.C.fromVal) isShadowed_ self
    fun remountFinish self result =
      (
        GioMountClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        remountFinish_
        (
          self
           & result
           & []
        )
    fun shadow self = (GioMountClass.C.withPtr ---> I) shadow_ self
    fun unmountWithOperationFinish self result =
      (
        GioMountClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        unmountWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun unshadow self = (GioMountClass.C.withPtr ---> I) unshadow_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun preUnmountSig f = signal "pre-unmount" (void ---> ret_void) f
      fun unmountedSig f = signal "unmounted" (void ---> ret_void) f
    end
  end
