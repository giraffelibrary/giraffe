structure GioMount :>
  GIO_MOUNT
    where type 'a class_t = 'a GioMountClass.t
    where type 'a drive_class_t = 'a GioDriveClass.t
    where type 'a icon_class_t = 'a GioIconClass.t
    where type 'a file_class_t = 'a GioFileClass.t
    where type 'a volume_class_t = 'a GioVolumeClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_mount_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val canEject_ = call (load_sym libgio "g_mount_can_eject") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val canUnmount_ = call (load_sym libgio "g_mount_can_unmount") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val ejectWithOperationFinish_ =
        call (load_sym libgio "g_mount_eject_with_operation_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getDefaultLocation_ = call (load_sym libgio "g_mount_get_default_location") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDrive_ = call (load_sym libgio "g_mount_get_drive") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIcon_ = call (load_sym libgio "g_mount_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getName_ = call (load_sym libgio "g_mount_get_name") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getRoot_ = call (load_sym libgio "g_mount_get_root") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getUuid_ = call (load_sym libgio "g_mount_get_uuid") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getVolume_ = call (load_sym libgio "g_mount_get_volume") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val isShadowed_ = call (load_sym libgio "g_mount_is_shadowed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val remountFinish_ =
        call (load_sym libgio "g_mount_remount_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val shadow_ = call (load_sym libgio "g_mount_shadow") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unmountWithOperationFinish_ =
        call (load_sym libgio "g_mount_unmount_with_operation_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val unshadow_ = call (load_sym libgio "g_mount_unshadow") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioMountClass.t
    type 'a drive_class_t = 'a GioDriveClass.t
    type 'a icon_class_t = 'a GioIconClass.t
    type 'a file_class_t = 'a GioFileClass.t
    type 'a volume_class_t = 'a GioVolumeClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canUnmount self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canUnmount_ self
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
    fun getDefaultLocation self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getDefaultLocation_ self
    fun getDrive self = (GObjectObjectClass.C.withPtr ---> GioDriveClass.C.fromPtr true) getDrive_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getRoot self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getRoot_ self
    fun getUuid self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getUuid_ self
    fun getVolume self = (GObjectObjectClass.C.withPtr ---> GioVolumeClass.C.fromPtr true) getVolume_ self
    fun isShadowed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isShadowed_ self
    fun remountFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        remountFinish_
        (
          self
           & result
           & []
        )
    fun shadow self = (GObjectObjectClass.C.withPtr ---> I) shadow_ self
    fun unmountWithOperationFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        unmountWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun unshadow self = (GObjectObjectClass.C.withPtr ---> I) unshadow_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun preUnmountSig f = signal "pre-unmount" (void ---> ret_void) f
      fun unmountedSig f = signal "unmounted" (void ---> ret_void) f
    end
  end
