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
      val getType_ = call (load_sym libgio "g_volume_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val canEject_ = call (load_sym libgio "g_volume_can_eject") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canMount_ = call (load_sym libgio "g_volume_can_mount") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val ejectWithOperationFinish_ =
        call (load_sym libgio "g_volume_eject_with_operation_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getActivationRoot_ = call (load_sym libgio "g_volume_get_activation_root") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDrive_ = call (load_sym libgio "g_volume_get_drive") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getIcon_ = call (load_sym libgio "g_volume_get_icon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getIdentifier_ = call (load_sym libgio "g_volume_get_identifier") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getMount_ = call (load_sym libgio "g_volume_get_mount") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getName_ = call (load_sym libgio "g_volume_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUuid_ = call (load_sym libgio "g_volume_get_uuid") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val mountFinish_ =
        call (load_sym libgio "g_volume_mount_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val shouldAutomount_ = call (load_sym libgio "g_volume_should_automount") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioVolumeClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a mount_class = 'a GioMountClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canMount self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canMount_ self
    fun ejectWithOperationFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        ejectWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun getActivationRoot self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getActivationRoot_ self
    fun getDrive self = (GObjectObjectClass.C.withPtr ---> GioDriveClass.C.fromPtr true) getDrive_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) getIdentifier_ (self & kind)
    fun getMount self = (GObjectObjectClass.C.withPtr ---> GioMountClass.C.fromPtr true) getMount_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getUuid self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getUuid_ self
    fun mountFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        mountFinish_
        (
          self
           & result
           & []
        )
    fun shouldAutomount self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) shouldAutomount_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun removedSig f = signal "removed" (void ---> ret_void) f
    end
  end
