structure GioVolume :>
  GIO_VOLUME
    where type 'a class = 'a GioVolumeClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_volume_get_type" : unit -> GObjectType.C.val_;
    val canEject_ = _import "g_volume_can_eject" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> FFI.Bool.C.val_;
    val canMount_ = _import "g_volume_can_mount" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> FFI.Bool.C.val_;
    val ejectWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_volume_eject_with_operation_finish" :
              GioVolumeClass.C.notnull GioVolumeClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getActivationRoot_ = _import "g_volume_get_activation_root" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> GioFileClass.C.notnull GioFileClass.C.p;
    val getDrive_ = _import "g_volume_get_drive" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> GioDriveClass.C.notnull GioDriveClass.C.p;
    val getIcon_ = _import "g_volume_get_icon" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val getIdentifier_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_volume_get_identifier" :
              GioVolumeClass.C.notnull GioVolumeClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getMount_ = _import "g_volume_get_mount" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> GioMountClass.C.notnull GioMountClass.C.p;
    val getName_ = _import "g_volume_get_name" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getUuid_ = _import "g_volume_get_uuid" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val mountFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_volume_mount_finish" :
              GioVolumeClass.C.notnull GioVolumeClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val shouldAutomount_ = _import "g_volume_should_automount" : GioVolumeClass.C.notnull GioVolumeClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GioVolumeClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a mount_class = 'a GioMountClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GioVolumeClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canMount self = (GioVolumeClass.C.withPtr ---> FFI.Bool.C.fromVal) canMount_ self
    fun ejectWithOperationFinish self result =
      (
        GioVolumeClass.C.withPtr
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
    fun getActivationRoot self = (GioVolumeClass.C.withPtr ---> GioFileClass.C.fromPtr true) getActivationRoot_ self
    fun getDrive self = (GioVolumeClass.C.withPtr ---> GioDriveClass.C.fromPtr true) getDrive_ self
    fun getIcon self = (GioVolumeClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GioVolumeClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) getIdentifier_ (self & kind)
    fun getMount self = (GioVolumeClass.C.withPtr ---> GioMountClass.C.fromPtr true) getMount_ self
    fun getName self = (GioVolumeClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getUuid self = (GioVolumeClass.C.withPtr ---> Utf8.C.fromPtr true) getUuid_ self
    fun mountFinish self result =
      (
        GioVolumeClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        mountFinish_
        (
          self
           & result
           & []
        )
    fun shouldAutomount self = (GioVolumeClass.C.withPtr ---> FFI.Bool.C.fromVal) shouldAutomount_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun removedSig f = signal "removed" (void ---> ret_void) f
    end
  end
