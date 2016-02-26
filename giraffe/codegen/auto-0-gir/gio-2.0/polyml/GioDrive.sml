structure GioDrive :>
  GIO_DRIVE
    where type 'a class_t = 'a GioDriveClass.t
    where type 'a icon_class_t = 'a GioIconClass.t
    where type drive_start_stop_type_t = GioDriveStartStopType.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_drive_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val canEject_ = call (load_sym libgio "g_drive_can_eject") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canPollForMedia_ = call (load_sym libgio "g_drive_can_poll_for_media") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canStart_ = call (load_sym libgio "g_drive_can_start") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canStartDegraded_ = call (load_sym libgio "g_drive_can_start_degraded") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canStop_ = call (load_sym libgio "g_drive_can_stop") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val ejectWithOperationFinish_ =
        call (load_sym libgio "g_drive_eject_with_operation_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getIcon_ = call (load_sym libgio "g_drive_get_icon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getIdentifier_ = call (load_sym libgio "g_drive_get_identifier") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgio "g_drive_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStartStopType_ = call (load_sym libgio "g_drive_get_start_stop_type") (GObjectObjectClass.PolyML.cPtr --> GioDriveStartStopType.PolyML.cVal)
      val hasMedia_ = call (load_sym libgio "g_drive_has_media") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasVolumes_ = call (load_sym libgio "g_drive_has_volumes") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isMediaCheckAutomatic_ = call (load_sym libgio "g_drive_is_media_check_automatic") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isMediaRemovable_ = call (load_sym libgio "g_drive_is_media_removable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val pollForMediaFinish_ =
        call (load_sym libgio "g_drive_poll_for_media_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val startFinish_ =
        call (load_sym libgio "g_drive_start_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val stopFinish_ =
        call (load_sym libgio "g_drive_stop_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class_t = 'a GioDriveClass.t
    type 'a icon_class_t = 'a GioIconClass.t
    type drive_start_stop_type_t = GioDriveStartStopType.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canPollForMedia self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canPollForMedia_ self
    fun canStart self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canStart_ self
    fun canStartDegraded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canStartDegraded_ self
    fun canStop self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canStop_ self
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
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) getIdentifier_ (self & kind)
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getStartStopType self = (GObjectObjectClass.C.withPtr ---> GioDriveStartStopType.C.fromVal) getStartStopType_ self
    fun hasMedia self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasMedia_ self
    fun hasVolumes self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasVolumes_ self
    fun isMediaCheckAutomatic self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isMediaCheckAutomatic_ self
    fun isMediaRemovable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isMediaRemovable_ self
    fun pollForMediaFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
