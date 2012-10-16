structure GioDrive :>
  GIO_DRIVE
    where type 'a class_t = 'a GioDriveClass.t
    where type 'a iconclass_t = 'a GioIconClass.t
    where type drivestartstoptype_t = GioDriveStartStopType.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_drive_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val canEject_ = call (load_sym libgio "g_drive_can_eject") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val canPollForMedia_ = call (load_sym libgio "g_drive_can_poll_for_media") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val canStart_ = call (load_sym libgio "g_drive_can_start") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val canStartDegraded_ = call (load_sym libgio "g_drive_can_start_degraded") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val canStop_ = call (load_sym libgio "g_drive_can_stop") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val ejectWithOperationFinish_ =
        call (load_sym libgio "g_drive_eject_with_operation_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val getIcon_ = call (load_sym libgio "g_drive_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIdentifier_ = call (load_sym libgio "g_drive_get_identifier") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val getName_ = call (load_sym libgio "g_drive_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getStartStopType_ = call (load_sym libgio "g_drive_get_start_stop_type") (GObjectObjectClass.PolyML.PTR --> GioDriveStartStopType.PolyML.VAL)
      val hasMedia_ = call (load_sym libgio "g_drive_has_media") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val hasVolumes_ = call (load_sym libgio "g_drive_has_volumes") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isMediaCheckAutomatic_ = call (load_sym libgio "g_drive_is_media_check_automatic") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isMediaRemovable_ = call (load_sym libgio "g_drive_is_media_removable") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val pollForMediaFinish_ =
        call (load_sym libgio "g_drive_poll_for_media_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val startFinish_ =
        call (load_sym libgio "g_drive_start_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val stopFinish_ =
        call (load_sym libgio "g_drive_stop_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
    end
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
