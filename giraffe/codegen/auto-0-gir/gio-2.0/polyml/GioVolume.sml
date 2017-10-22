structure GioVolume :>
  GIO_VOLUME
    where type 'a class = 'a GioVolumeClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_volume_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val canEject_ = call (getSymbol "g_volume_can_eject") (GioVolumeClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canMount_ = call (getSymbol "g_volume_can_mount") (GioVolumeClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val ejectFinish_ =
        call (getSymbol "g_volume_eject_finish")
          (
            GioVolumeClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val ejectWithOperationFinish_ =
        call (getSymbol "g_volume_eject_with_operation_finish")
          (
            GioVolumeClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val enumerateIdentifiers_ = call (getSymbol "g_volume_enumerate_identifiers") (GioVolumeClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getActivationRoot_ = call (getSymbol "g_volume_get_activation_root") (GioVolumeClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getDrive_ = call (getSymbol "g_volume_get_drive") (GioVolumeClass.PolyML.cPtr --> GioDriveClass.PolyML.cPtr)
      val getIcon_ = call (getSymbol "g_volume_get_icon") (GioVolumeClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIdentifier_ = call (getSymbol "g_volume_get_identifier") (GioVolumeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getMount_ = call (getSymbol "g_volume_get_mount") (GioVolumeClass.PolyML.cPtr --> GioMountClass.PolyML.cPtr)
      val getName_ = call (getSymbol "g_volume_get_name") (GioVolumeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSortKey_ = call (getSymbol "g_volume_get_sort_key") (GioVolumeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSymbolicIcon_ = call (getSymbol "g_volume_get_symbolic_icon") (GioVolumeClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getUuid_ = call (getSymbol "g_volume_get_uuid") (GioVolumeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val mountFinish_ =
        call (getSymbol "g_volume_mount_finish")
          (
            GioVolumeClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val shouldAutomount_ = call (getSymbol "g_volume_should_automount") (GioVolumeClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioVolumeClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a mount_class = 'a GioMountClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canEject self = (GioVolumeClass.FFI.withPtr ---> GBool.FFI.fromVal) canEject_ self
    fun canMount self = (GioVolumeClass.FFI.withPtr ---> GBool.FFI.fromVal) canMount_ self
    fun ejectFinish self result =
      (
        GioVolumeClass.FFI.withPtr
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
        GioVolumeClass.FFI.withPtr
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
    fun enumerateIdentifiers self = (GioVolumeClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) enumerateIdentifiers_ self
    fun getActivationRoot self = (GioVolumeClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getActivationRoot_ self
    fun getDrive self = (GioVolumeClass.FFI.withPtr ---> GioDriveClass.FFI.fromPtr true) getDrive_ self
    fun getIcon self = (GioVolumeClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GioVolumeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getIdentifier_ (self & kind)
    fun getMount self = (GioVolumeClass.FFI.withPtr ---> GioMountClass.FFI.fromPtr true) getMount_ self
    fun getName self = (GioVolumeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getName_ self
    fun getSortKey self = (GioVolumeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSortKey_ self
    fun getSymbolicIcon self = (GioVolumeClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) getSymbolicIcon_ self
    fun getUuid self = (GioVolumeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getUuid_ self
    fun mountFinish self result =
      (
        GioVolumeClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        mountFinish_
        (
          self
           & result
           & []
        )
    fun shouldAutomount self = (GioVolumeClass.FFI.withPtr ---> GBool.FFI.fromVal) shouldAutomount_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun removedSig f = signal "removed" (void ---> ret_void) f
    end
  end
