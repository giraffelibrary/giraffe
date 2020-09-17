structure GioVolume :>
  GIO_VOLUME
    where type 'a class = 'a GioVolumeClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_volume_get_type" : unit -> GObjectType.FFI.val_;
    val canEject_ = _import "g_volume_can_eject" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> GBool.FFI.val_;
    val canMount_ = _import "g_volume_can_mount" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> GBool.FFI.val_;
    val ejectFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_volume_eject_finish" :
              GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p
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
            _import "g_volume_eject_with_operation_finish" :
              GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val enumerateIdentifiers_ = _import "g_volume_enumerate_identifiers" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getActivationRoot_ = _import "g_volume_get_activation_root" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> GioFileClass.FFI.opt GioFileClass.FFI.p;
    val getDrive_ = _import "g_volume_get_drive" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> GioDriveClass.FFI.non_opt GioDriveClass.FFI.p;
    val getIcon_ = _import "g_volume_get_icon" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getIdentifier_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_volume_get_identifier" :
              GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getMount_ = _import "g_volume_get_mount" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> GioMountClass.FFI.non_opt GioMountClass.FFI.p;
    val getName_ = _import "g_volume_get_name" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getSortKey_ = _import "g_volume_get_sort_key" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getSymbolicIcon_ = _import "g_volume_get_symbolic_icon" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getUuid_ = _import "g_volume_get_uuid" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val mountFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_volume_mount_finish" :
              GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val shouldAutomount_ = _import "g_volume_should_automount" : GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioVolumeClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a mount_class = 'a GioMountClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canEject self = (GioVolumeClass.FFI.withPtr false ---> GBool.FFI.fromVal) canEject_ self
    fun canMount self = (GioVolumeClass.FFI.withPtr false ---> GBool.FFI.fromVal) canMount_ self
    fun ejectFinish self result =
      (
        GioVolumeClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioVolumeClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        ejectWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun enumerateIdentifiers self = (GioVolumeClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) enumerateIdentifiers_ self
    fun getActivationRoot self = (GioVolumeClass.FFI.withPtr false ---> GioFileClass.FFI.fromOptPtr true) getActivationRoot_ self
    fun getDrive self = (GioVolumeClass.FFI.withPtr false ---> GioDriveClass.FFI.fromPtr true) getDrive_ self
    fun getIcon self = (GioVolumeClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GioVolumeClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) getIdentifier_ (self & kind)
    fun getMount self = (GioVolumeClass.FFI.withPtr false ---> GioMountClass.FFI.fromPtr true) getMount_ self
    fun getName self = (GioVolumeClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getName_ self
    fun getSortKey self = (GioVolumeClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getSortKey_ self before GioVolumeClass.FFI.touchPtr self
    fun getSymbolicIcon self = (GioVolumeClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) getSymbolicIcon_ self
    fun getUuid self = (GioVolumeClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getUuid_ self
    fun mountFinish self result =
      (
        GioVolumeClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        mountFinish_
        (
          self
           & result
           & []
        )
    fun shouldAutomount self = (GioVolumeClass.FFI.withPtr false ---> GBool.FFI.fromVal) shouldAutomount_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun removedSig f = signal "removed" (void ---> ret_void) f
    end
  end
