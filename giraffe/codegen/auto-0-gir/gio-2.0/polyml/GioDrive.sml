structure GioDrive :>
  GIO_DRIVE
    where type 'a class = 'a GioDriveClass.class
    where type drive_start_stop_type_t = GioDriveStartStopType.t
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_drive_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val canEject_ = call (getSymbol "g_drive_can_eject") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canPollForMedia_ = call (getSymbol "g_drive_can_poll_for_media") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canStart_ = call (getSymbol "g_drive_can_start") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canStartDegraded_ = call (getSymbol "g_drive_can_start_degraded") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canStop_ = call (getSymbol "g_drive_can_stop") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val ejectFinish_ =
        call (getSymbol "g_drive_eject_finish")
          (
            GioDriveClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val ejectWithOperationFinish_ =
        call (getSymbol "g_drive_eject_with_operation_finish")
          (
            GioDriveClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val enumerateIdentifiers_ = call (getSymbol "g_drive_enumerate_identifiers") (GioDriveClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getIcon_ = call (getSymbol "g_drive_get_icon") (GioDriveClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIdentifier_ = call (getSymbol "g_drive_get_identifier") (GioDriveClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "g_drive_get_name") (GioDriveClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSortKey_ = call (getSymbol "g_drive_get_sort_key") (GioDriveClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStartStopType_ = call (getSymbol "g_drive_get_start_stop_type") (GioDriveClass.PolyML.cPtr --> GioDriveStartStopType.PolyML.cVal)
      val getSymbolicIcon_ = call (getSymbol "g_drive_get_symbolic_icon") (GioDriveClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val hasMedia_ = call (getSymbol "g_drive_has_media") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasVolumes_ = call (getSymbol "g_drive_has_volumes") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isMediaCheckAutomatic_ = call (getSymbol "g_drive_is_media_check_automatic") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isMediaRemovable_ = call (getSymbol "g_drive_is_media_removable") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isRemovable_ = call (getSymbol "g_drive_is_removable") (GioDriveClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val pollForMediaFinish_ =
        call (getSymbol "g_drive_poll_for_media_finish")
          (
            GioDriveClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val startFinish_ =
        call (getSymbol "g_drive_start_finish")
          (
            GioDriveClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val stopFinish_ =
        call (getSymbol "g_drive_stop_finish")
          (
            GioDriveClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
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
