structure GioMount :>
  GIO_MOUNT
    where type 'a class = 'a GioMountClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a volume_class = 'a GioVolumeClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_mount_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val canEject_ = call (getSymbol "g_mount_can_eject") (GioMountClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canUnmount_ = call (getSymbol "g_mount_can_unmount") (GioMountClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val ejectFinish_ =
        call (getSymbol "g_mount_eject_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val ejectWithOperationFinish_ =
        call (getSymbol "g_mount_eject_with_operation_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getDefaultLocation_ = call (getSymbol "g_mount_get_default_location") (GioMountClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getDrive_ = call (getSymbol "g_mount_get_drive") (GioMountClass.PolyML.cPtr --> GioDriveClass.PolyML.cPtr)
      val getIcon_ = call (getSymbol "g_mount_get_icon") (GioMountClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getName_ = call (getSymbol "g_mount_get_name") (GioMountClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRoot_ = call (getSymbol "g_mount_get_root") (GioMountClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getSortKey_ = call (getSymbol "g_mount_get_sort_key") (GioMountClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSymbolicIcon_ = call (getSymbol "g_mount_get_symbolic_icon") (GioMountClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getUuid_ = call (getSymbol "g_mount_get_uuid") (GioMountClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVolume_ = call (getSymbol "g_mount_get_volume") (GioMountClass.PolyML.cPtr --> GioVolumeClass.PolyML.cPtr)
      val guessContentTypeFinish_ =
        call (getSymbol "g_mount_guess_content_type_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CArray.PolyML.cOutPtr
          )
      val guessContentTypeSync_ =
        call (getSymbol "g_mount_guess_content_type_sync")
          (
            GioMountClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CArray.PolyML.cOutPtr
          )
      val isShadowed_ = call (getSymbol "g_mount_is_shadowed") (GioMountClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val remountFinish_ =
        call (getSymbol "g_mount_remount_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val shadow_ = call (getSymbol "g_mount_shadow") (GioMountClass.PolyML.cPtr --> cVoid)
      val unmountFinish_ =
        call (getSymbol "g_mount_unmount_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val unmountWithOperationFinish_ =
        call (getSymbol "g_mount_unmount_with_operation_finish")
          (
            GioMountClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val unshadow_ = call (getSymbol "g_mount_unshadow") (GioMountClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioMountClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a volume_class = 'a GioVolumeClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canEject self = (GioMountClass.FFI.withPtr ---> GBool.FFI.fromVal) canEject_ self
    fun canUnmount self = (GioMountClass.FFI.withPtr ---> GBool.FFI.fromVal) canUnmount_ self
    fun ejectFinish self result =
      (
        GioMountClass.FFI.withPtr
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
        GioMountClass.FFI.withPtr
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
    fun getDefaultLocation self = (GioMountClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getDefaultLocation_ self
    fun getDrive self = (GioMountClass.FFI.withPtr ---> GioDriveClass.FFI.fromPtr true) getDrive_ self
    fun getIcon self = (GioMountClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) getIcon_ self
    fun getName self = (GioMountClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getName_ self
    fun getRoot self = (GioMountClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getRoot_ self
    fun getSortKey self = (GioMountClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSortKey_ self
    fun getSymbolicIcon self = (GioMountClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) getSymbolicIcon_ self
    fun getUuid self = (GioMountClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getUuid_ self
    fun getVolume self = (GioMountClass.FFI.withPtr ---> GioVolumeClass.FFI.fromPtr true) getVolume_ self
    fun guessContentTypeFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8CArray.FFI.fromPtr 2
      )
        guessContentTypeFinish_
        (
          self
           & result
           & []
        )
    fun guessContentTypeSync self (forceRescan, cancellable) =
      (
        GioMountClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8CArray.FFI.fromPtr 2
      )
        guessContentTypeSync_
        (
          self
           & forceRescan
           & cancellable
           & []
        )
    fun isShadowed self = (GioMountClass.FFI.withPtr ---> GBool.FFI.fromVal) isShadowed_ self
    fun remountFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        remountFinish_
        (
          self
           & result
           & []
        )
    fun shadow self = (GioMountClass.FFI.withPtr ---> I) shadow_ self
    fun unmountFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        unmountFinish_
        (
          self
           & result
           & []
        )
    fun unmountWithOperationFinish self result =
      (
        GioMountClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        unmountWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun unshadow self = (GioMountClass.FFI.withPtr ---> I) unshadow_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun preUnmountSig f = signal "pre-unmount" (void ---> ret_void) f
      fun unmountedSig f = signal "unmounted" (void ---> ret_void) f
    end
  end
