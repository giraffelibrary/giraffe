structure GioDrive :>
  GIO_DRIVE
    where type 'a class_t = 'a GioDriveClass.t
    where type 'a iconclass_t = 'a GioIconClass.t
    where type drivestartstoptype_t = GioDriveStartStopType.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_drive_get_type" : unit -> GObjectType.C.val_;
    val canEject_ = _import "g_drive_can_eject" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val canPollForMedia_ = _import "g_drive_can_poll_for_media" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val canStart_ = _import "g_drive_can_start" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val canStartDegraded_ = _import "g_drive_can_start_degraded" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val canStop_ = _import "g_drive_can_stop" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val ejectWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_drive_eject_with_operation_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIcon_ = _import "g_drive_get_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIdentifier_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_drive_get_identifier" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getName_ = _import "g_drive_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getStartStopType_ = _import "g_drive_get_start_stop_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDriveStartStopType.C.val_;
    val hasMedia_ = _import "g_drive_has_media" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val hasVolumes_ = _import "g_drive_has_volumes" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val isMediaCheckAutomatic_ = _import "g_drive_is_media_check_automatic" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val isMediaRemovable_ = _import "g_drive_is_media_removable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val pollForMediaFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_drive_poll_for_media_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val startFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_drive_start_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val stopFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_drive_stop_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioDriveClass.t
    type 'a iconclass_t = 'a GioIconClass.t
    type drivestartstoptype_t = GioDriveStartStopType.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canEject_ self
    fun canPollForMedia self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canPollForMedia_ self
    fun canStart self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canStart_ self
    fun canStartDegraded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canStartDegraded_ self
    fun canStop self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canStop_ self
    fun ejectWithOperationFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        ejectWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) getIdentifier_ (self & kind)
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getName_ self
    fun getStartStopType self = (GObjectObjectClass.C.withPtr ---> GioDriveStartStopType.C.fromVal) getStartStopType_ self
    fun hasMedia self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasMedia_ self
    fun hasVolumes self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasVolumes_ self
    fun isMediaCheckAutomatic self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isMediaCheckAutomatic_ self
    fun isMediaRemovable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isMediaRemovable_ self
    fun pollForMediaFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        pollForMediaFinish_
        (
          self
           & result
           & []
        )
    fun startFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        startFinish_
        (
          self
           & result
           & []
        )
    fun stopFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        stopFinish_
        (
          self
           & result
           & []
        )
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun disconnectedSig f = signal "disconnected" (void ---> ret_void) f
      fun ejectButtonSig f = signal "eject-button" (void ---> ret_void) f
      fun stopButtonSig f = signal "stop-button" (void ---> ret_void) f
    end
  end
