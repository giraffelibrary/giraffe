structure GioVolumeMonitor :>
  GIO_VOLUME_MONITOR
    where type 'a class_t = 'a GioVolumeMonitorClass.t
    where type 'a drive_class_t = 'a GioDriveClass.t
    where type 'a mount_class_t = 'a GioMountClass.t
    where type 'a volume_class_t = 'a GioVolumeClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_volume_monitor_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val get_ = call (load_sym libgio "g_volume_monitor_get") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getMountForUuid_ = call (load_sym libgio "g_volume_monitor_get_mount_for_uuid") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getVolumeForUuid_ = call (load_sym libgio "g_volume_monitor_get_volume_for_uuid") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioVolumeMonitorClass.t
    type 'a drive_class_t = 'a GioDriveClass.t
    type 'a mount_class_t = 'a GioMountClass.t
    type 'a volume_class_t = 'a GioVolumeClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun get () = (I ---> GioVolumeMonitorClass.C.fromPtr true) get_ ()
    fun getMountForUuid self uuid = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioMountClass.C.fromPtr true) getMountForUuid_ (self & uuid)
    fun getVolumeForUuid self uuid = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioVolumeClass.C.fromPtr true) getVolumeForUuid_ (self & uuid)
    local
      open ClosureMarshal Signal
    in
      fun driveChangedSig f = signal "drive-changed" (get 0w1 GioDriveClass.t ---> ret_void) f
      fun driveConnectedSig f = signal "drive-connected" (get 0w1 GioDriveClass.t ---> ret_void) f
      fun driveDisconnectedSig f = signal "drive-disconnected" (get 0w1 GioDriveClass.t ---> ret_void) f
      fun driveEjectButtonSig f = signal "drive-eject-button" (get 0w1 GioDriveClass.t ---> ret_void) f
      fun driveStopButtonSig f = signal "drive-stop-button" (get 0w1 GioDriveClass.t ---> ret_void) f
      fun mountAddedSig f = signal "mount-added" (get 0w1 GioMountClass.t ---> ret_void) f
      fun mountChangedSig f = signal "mount-changed" (get 0w1 GioMountClass.t ---> ret_void) f
      fun mountPreUnmountSig f = signal "mount-pre-unmount" (get 0w1 GioMountClass.t ---> ret_void) f
      fun mountRemovedSig f = signal "mount-removed" (get 0w1 GioMountClass.t ---> ret_void) f
      fun volumeAddedSig f = signal "volume-added" (get 0w1 GioVolumeClass.t ---> ret_void) f
      fun volumeChangedSig f = signal "volume-changed" (get 0w1 GioVolumeClass.t ---> ret_void) f
      fun volumeRemovedSig f = signal "volume-removed" (get 0w1 GioVolumeClass.t ---> ret_void) f
    end
  end
