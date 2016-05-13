structure GioVolume :>
  GIO_VOLUME
    where type 'a class = 'a GioVolumeClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_volume_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val canEject_ = call (load_sym libgio "g_volume_can_eject") (GioVolumeClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canMount_ = call (load_sym libgio "g_volume_can_mount") (GioVolumeClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val ejectWithOperationFinish_ =
        call (load_sym libgio "g_volume_eject_with_operation_finish")
          (
            GioVolumeClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getActivationRoot_ = call (load_sym libgio "g_volume_get_activation_root") (GioVolumeClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getDrive_ = call (load_sym libgio "g_volume_get_drive") (GioVolumeClass.PolyML.cPtr --> GioDriveClass.PolyML.cPtr)
      val getIcon_ = call (load_sym libgio "g_volume_get_icon") (GioVolumeClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIdentifier_ = call (load_sym libgio "g_volume_get_identifier") (GioVolumeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getMount_ = call (load_sym libgio "g_volume_get_mount") (GioVolumeClass.PolyML.cPtr --> GioMountClass.PolyML.cPtr)
      val getName_ = call (load_sym libgio "g_volume_get_name") (GioVolumeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUuid_ = call (load_sym libgio "g_volume_get_uuid") (GioVolumeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val mountFinish_ =
        call (load_sym libgio "g_volume_mount_finish")
          (
            GioVolumeClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val shouldAutomount_ = call (load_sym libgio "g_volume_should_automount") (GioVolumeClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
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
