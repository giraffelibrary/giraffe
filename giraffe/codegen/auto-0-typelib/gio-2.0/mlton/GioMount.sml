structure GioMount :>
  GIO_MOUNT
    where type 'a class = 'a GioMountClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a volume_class = 'a GioVolumeClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_mount_get_type" : unit -> GObjectType.FFI.val_;
    val canEject_ = _import "g_mount_can_eject" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GBool.FFI.val_;
    val canUnmount_ = _import "g_mount_can_unmount" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GBool.FFI.val_;
    val ejectFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_eject_finish" :
              GioMountClass.FFI.non_opt GioMountClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val ejectWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_eject_with_operation_finish" :
              GioMountClass.FFI.non_opt GioMountClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultLocation_ = _import "g_mount_get_default_location" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val getDrive_ = _import "g_mount_get_drive" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GioDriveClass.FFI.non_opt GioDriveClass.FFI.p;
    val getIcon_ = _import "g_mount_get_icon" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getName_ = _import "g_mount_get_name" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getRoot_ = _import "g_mount_get_root" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val getSortKey_ = _import "g_mount_get_sort_key" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getSymbolicIcon_ = _import "g_mount_get_symbolic_icon" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getUuid_ = _import "g_mount_get_uuid" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getVolume_ = _import "g_mount_get_volume" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p;
    val guessContentTypeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_guess_content_type_finish" :
              GioMountClass.FFI.non_opt GioMountClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val guessContentTypeSync_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_mount_guess_content_type_sync" :
              GioMountClass.FFI.non_opt GioMountClass.FFI.p
               * GBool.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isShadowed_ = _import "g_mount_is_shadowed" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GBool.FFI.val_;
    val remountFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_remount_finish" :
              GioMountClass.FFI.non_opt GioMountClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val shadow_ = _import "g_mount_shadow" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> unit;
    val unmountFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_unmount_finish" :
              GioMountClass.FFI.non_opt GioMountClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unmountWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mount_unmount_with_operation_finish" :
              GioMountClass.FFI.non_opt GioMountClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unshadow_ = _import "g_mount_unshadow" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> unit;
    type 'a class = 'a GioMountClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a volume_class = 'a GioVolumeClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canEject self = (GioMountClass.FFI.withPtr ---> GBool.FFI.fromVal) canEject_ self
    fun canUnmount self = (GioMountClass.FFI.withPtr ---> GBool.FFI.fromVal) canUnmount_ self
    fun ejectFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        ejectFinish_
        (
          self
           & result
           & []
        )
    fun ejectWithOperationFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        ejectWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun getDefaultLocation self = (GioMountClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getDefaultLocation_ self
    fun getDrive self = (GioMountClass.FFI.withPtr ---> GioDriveClass.FFI.fromPtr true) getDrive_ self
    fun getIcon self = (GioMountClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) getIcon_ self
    fun getName self = (GioMountClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getName_ self
    fun getRoot self = (GioMountClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getRoot_ self
    fun getSortKey self = (GioMountClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSortKey_ self
    fun getSymbolicIcon self = (GioMountClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) getSymbolicIcon_ self
    fun getUuid self = (GioMountClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getUuid_ self
    fun getVolume self = (GioMountClass.FFI.withPtr ---> GioVolumeClass.FFI.fromPtr true) getVolume_ self
    fun guessContentTypeFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8CPtrArray.FFI.fromPtr 2
      )
        guessContentTypeFinish_
        (
          self
           & result
           & []
        )
    fun guessContentTypeSync self (forceRescan, cancellable) =
      (
        GioMountClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8CPtrArray.FFI.fromPtr 2
      )
        guessContentTypeSync_
        (
          self
           & forceRescan
           & cancellable
           & []
        )
    fun isShadowed self = (GioMountClass.FFI.withPtr ---> GBool.FFI.fromVal) isShadowed_ self
    fun remountFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        remountFinish_
        (
          self
           & result
           & []
        )
    fun shadow self = (GioMountClass.FFI.withPtr ---> I) shadow_ self
    fun unmountFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        unmountFinish_
        (
          self
           & result
           & []
        )
    fun unmountWithOperationFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        unmountWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun unshadow self = (GioMountClass.FFI.withPtr ---> I) unshadow_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun preUnmountSig f = signal "pre-unmount" (void ---> ret_void) f
      fun unmountedSig f = signal "unmounted" (void ---> ret_void) f
    end
  end
