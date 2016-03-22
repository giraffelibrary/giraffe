structure GioDrive :>
  GIO_DRIVE
    where type 'a class = 'a GioDriveClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type drive_start_stop_type_t = GioDriveStartStopType.t
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_drive_get_type" : unit -> GObjectType.C.val_;
    val canEject_ = _import "g_drive_can_eject" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val canPollForMedia_ = _import "g_drive_can_poll_for_media" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val canStart_ = _import "g_drive_can_start" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val canStartDegraded_ = _import "g_drive_can_start_degraded" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val canStop_ = _import "g_drive_can_stop" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val ejectWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_drive_eject_with_operation_finish" :
              GioDriveClass.C.notnull GioDriveClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIcon_ = _import "g_drive_get_icon" : GioDriveClass.C.notnull GioDriveClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val getIdentifier_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_drive_get_identifier" :
              GioDriveClass.C.notnull GioDriveClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getName_ = _import "g_drive_get_name" : GioDriveClass.C.notnull GioDriveClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getStartStopType_ = _import "g_drive_get_start_stop_type" : GioDriveClass.C.notnull GioDriveClass.C.p -> GioDriveStartStopType.C.val_;
    val hasMedia_ = _import "g_drive_has_media" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val hasVolumes_ = _import "g_drive_has_volumes" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val isMediaCheckAutomatic_ = _import "g_drive_is_media_check_automatic" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val isMediaRemovable_ = _import "g_drive_is_media_removable" : GioDriveClass.C.notnull GioDriveClass.C.p -> FFI.Bool.C.val_;
    val pollForMediaFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_drive_poll_for_media_finish" :
              GioDriveClass.C.notnull GioDriveClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioDriveClass.C.notnull GioDriveClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioDriveClass.C.notnull GioDriveClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDriveClass.class
    type 'a icon_class = 'a GioIconClass.class
    type drive_start_stop_type_t = GioDriveStartStopType.t
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canPollForMedia self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) canPollForMedia_ self
    fun canStart self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) canStart_ self
    fun canStartDegraded self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) canStartDegraded_ self
    fun canStop self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) canStop_ self
    fun ejectWithOperationFinish self result =
      (
        GioDriveClass.C.withPtr
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
    fun getIcon self = (GioDriveClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GioDriveClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) getIdentifier_ (self & kind)
    fun getName self = (GioDriveClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getStartStopType self = (GioDriveClass.C.withPtr ---> GioDriveStartStopType.C.fromVal) getStartStopType_ self
    fun hasMedia self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) hasMedia_ self
    fun hasVolumes self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) hasVolumes_ self
    fun isMediaCheckAutomatic self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) isMediaCheckAutomatic_ self
    fun isMediaRemovable self = (GioDriveClass.C.withPtr ---> FFI.Bool.C.fromVal) isMediaRemovable_ self
    fun pollForMediaFinish self result =
      (
        GioDriveClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        pollForMediaFinish_
        (
          self
           & result
           & []
        )
    fun startFinish self result =
      (
        GioDriveClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        startFinish_
        (
          self
           & result
           & []
        )
    fun stopFinish self result =
      (
        GioDriveClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
