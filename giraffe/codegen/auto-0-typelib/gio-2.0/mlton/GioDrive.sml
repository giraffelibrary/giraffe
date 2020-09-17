structure GioDrive :>
  GIO_DRIVE
    where type 'a class = 'a GioDriveClass.class
    where type drive_start_stop_type_t = GioDriveStartStopType.t
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_drive_get_type" : unit -> GObjectType.FFI.val_;
    val canEject_ = _import "g_drive_can_eject" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val canPollForMedia_ = _import "g_drive_can_poll_for_media" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val canStart_ = _import "g_drive_can_start" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val canStartDegraded_ = _import "g_drive_can_start_degraded" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val canStop_ = _import "g_drive_can_stop" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val ejectFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_drive_eject_finish" :
              GioDriveClass.FFI.non_opt GioDriveClass.FFI.p
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
            _import "g_drive_eject_with_operation_finish" :
              GioDriveClass.FFI.non_opt GioDriveClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val enumerateIdentifiers_ = _import "g_drive_enumerate_identifiers" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getIcon_ = _import "g_drive_get_icon" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getIdentifier_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_drive_get_identifier" :
              GioDriveClass.FFI.non_opt GioDriveClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getName_ = _import "g_drive_get_name" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getSortKey_ = _import "g_drive_get_sort_key" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getStartStopType_ = _import "g_drive_get_start_stop_type" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GioDriveStartStopType.FFI.val_;
    val getSymbolicIcon_ = _import "g_drive_get_symbolic_icon" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val hasMedia_ = _import "g_drive_has_media" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val hasVolumes_ = _import "g_drive_has_volumes" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val isMediaCheckAutomatic_ = _import "g_drive_is_media_check_automatic" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val isMediaRemovable_ = _import "g_drive_is_media_removable" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val isRemovable_ = _import "g_drive_is_removable" : GioDriveClass.FFI.non_opt GioDriveClass.FFI.p -> GBool.FFI.val_;
    val pollForMediaFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_drive_poll_for_media_finish" :
              GioDriveClass.FFI.non_opt GioDriveClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioDriveClass.FFI.non_opt GioDriveClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioDriveClass.FFI.non_opt GioDriveClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDriveClass.class
    type drive_start_stop_type_t = GioDriveStartStopType.t
    type 'a icon_class = 'a GioIconClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canEject self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) canEject_ self
    fun canPollForMedia self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) canPollForMedia_ self
    fun canStart self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) canStart_ self
    fun canStartDegraded self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) canStartDegraded_ self
    fun canStop self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) canStop_ self
    fun ejectFinish self result =
      (
        GioDriveClass.FFI.withPtr false
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
        GioDriveClass.FFI.withPtr false
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
    fun enumerateIdentifiers self = (GioDriveClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) enumerateIdentifiers_ self
    fun getIcon self = (GioDriveClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GioDriveClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) getIdentifier_ (self & kind)
    fun getName self = (GioDriveClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getName_ self
    fun getSortKey self = (GioDriveClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getSortKey_ self before GioDriveClass.FFI.touchPtr self
    fun getStartStopType self = (GioDriveClass.FFI.withPtr false ---> GioDriveStartStopType.FFI.fromVal) getStartStopType_ self
    fun getSymbolicIcon self = (GioDriveClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr true) getSymbolicIcon_ self
    fun hasMedia self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasMedia_ self
    fun hasVolumes self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasVolumes_ self
    fun isMediaCheckAutomatic self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) isMediaCheckAutomatic_ self
    fun isMediaRemovable self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) isMediaRemovable_ self
    fun isRemovable self = (GioDriveClass.FFI.withPtr false ---> GBool.FFI.fromVal) isRemovable_ self
    fun pollForMediaFinish self result =
      (
        GioDriveClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        pollForMediaFinish_
        (
          self
           & result
           & []
        )
    fun startFinish self result =
      (
        GioDriveClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        startFinish_
        (
          self
           & result
           & []
        )
    fun stopFinish self result =
      (
        GioDriveClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
