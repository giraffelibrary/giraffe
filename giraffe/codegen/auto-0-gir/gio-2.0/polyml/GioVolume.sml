structure GioVolume :>
  GIO_VOLUME
    where type 'a class_t = 'a GioVolumeClass.t
    where type 'a file_class_t = 'a GioFileClass.t
    where type 'a drive_class_t = 'a GioDriveClass.t
    where type 'a icon_class_t = 'a GioIconClass.t
    where type 'a mount_class_t = 'a GioMountClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_volume_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val canEject_ = call (load_sym libgio "g_volume_can_eject") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val canMount_ = call (load_sym libgio "g_volume_can_mount") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val ejectWithOperationFinish_ =
        call (load_sym libgio "g_volume_eject_with_operation_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getActivationRoot_ = call (load_sym libgio "g_volume_get_activation_root") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDrive_ = call (load_sym libgio "g_volume_get_drive") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIcon_ = call (load_sym libgio "g_volume_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIdentifier_ = call (load_sym libgio "g_volume_get_identifier") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
      val getMount_ = call (load_sym libgio "g_volume_get_mount") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getName_ = call (load_sym libgio "g_volume_get_name") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getUuid_ = call (load_sym libgio "g_volume_get_uuid") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val mountFinish_ =
        call (load_sym libgio "g_volume_mount_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val shouldAutomount_ = call (load_sym libgio "g_volume_should_automount") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioVolumeClass.t
    type 'a file_class_t = 'a GioFileClass.t
    type 'a drive_class_t = 'a GioDriveClass.t
    type 'a icon_class_t = 'a GioIconClass.t
    type 'a mount_class_t = 'a GioMountClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canEject self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canEject_ self
    fun canMount self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canMount_ self
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
    fun getActivationRoot self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getActivationRoot_ self
    fun getDrive self = (GObjectObjectClass.C.withPtr ---> GioDriveClass.C.fromPtr true) getDrive_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) getIcon_ self
    fun getIdentifier self kind = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr true) getIdentifier_ (self & kind)
    fun getMount self = (GObjectObjectClass.C.withPtr ---> GioMountClass.C.fromPtr true) getMount_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun getUuid self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getUuid_ self
    fun mountFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
