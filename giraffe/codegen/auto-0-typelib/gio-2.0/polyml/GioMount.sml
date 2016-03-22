structure GioMount :>
  GIO_MOUNT
    where type 'a class = 'a GioMountClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a volume_class = 'a GioVolumeClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_mount_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val canEject_ = call (load_sym libgio "g_mount_can_eject") (GioMountClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canUnmount_ = call (load_sym libgio "g_mount_can_unmount") (GioMountClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val ejectWithOperationFinish_ =
        call (load_sym libgio "g_mount_eject_with_operation_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getDefaultLocation_ = call (load_sym libgio "g_mount_get_default_location") (GioMountClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getDrive_ = call (load_sym libgio "g_mount_get_drive") (GioMountClass.PolyML.cPtr --> GioDriveClass.PolyML.cPtr)
      val getIcon_ = call (load_sym libgio "g_mount_get_icon") (GioMountClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getName_ = call (load_sym libgio "g_mount_get_name") (GioMountClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRoot_ = call (load_sym libgio "g_mount_get_root") (GioMountClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getUuid_ = call (load_sym libgio "g_mount_get_uuid") (GioMountClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVolume_ = call (load_sym libgio "g_mount_get_volume") (GioMountClass.PolyML.cPtr --> GioVolumeClass.PolyML.cPtr)
      val isShadowed_ = call (load_sym libgio "g_mount_is_shadowed") (GioMountClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val remountFinish_ =
        call (load_sym libgio "g_mount_remount_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val shadow_ = call (load_sym libgio "g_mount_shadow") (GioMountClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unmountWithOperationFinish_ =
        call (load_sym libgio "g_mount_unmount_with_operation_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val unshadow_ = call (load_sym libgio "g_mount_unshadow") (GioMountClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioMountClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a volume_class = 'a GioVolumeClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GioMountClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canUnmount self = (GioMountClass.C.withPtr ---> FFI.Bool.C.fromVal) canUnmount_ self
    fun ejectWithOperationFinish self result =
      (
        GioMountClass.C.withPtr
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
    fun getDefaultLocation self = (GioMountClass.C.withPtr ---> GioFileClass.C.fromPtr true) getDefaultLocation_ self
    fun getDrive self = (GioMountClass.C.withPtr ---> GioDriveClass.C.fromPtr true) getDrive_ self
    fun getIcon self = (GioMountClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getName self = (GioMountClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getRoot self = (GioMountClass.C.withPtr ---> GioFileClass.C.fromPtr true) getRoot_ self
    fun getUuid self = (GioMountClass.C.withPtr ---> Utf8.C.fromPtr true) getUuid_ self
    fun getVolume self = (GioMountClass.C.withPtr ---> GioVolumeClass.C.fromPtr true) getVolume_ self
    fun isShadowed self = (GioMountClass.C.withPtr ---> FFI.Bool.C.fromVal) isShadowed_ self
    fun remountFinish self result =
      (
        GioMountClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        remountFinish_
        (
          self
           & result
           & []
        )
    fun shadow self = (GioMountClass.C.withPtr ---> I) shadow_ self
    fun unmountWithOperationFinish self result =
      (
        GioMountClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        unmountWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun unshadow self = (GioMountClass.C.withPtr ---> I) unshadow_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun preUnmountSig f = signal "pre-unmount" (void ---> ret_void) f
      fun unmountedSig f = signal "unmounted" (void ---> ret_void) f
    end
  end
