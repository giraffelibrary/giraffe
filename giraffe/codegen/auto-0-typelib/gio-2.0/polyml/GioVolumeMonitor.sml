structure GioVolumeMonitor :>
  GIO_VOLUME_MONITOR
    where type 'a class = 'a GioVolumeMonitorClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a volume_class = 'a GioVolumeClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_volume_monitor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val adoptOrphanMount_ = call (getSymbol "g_volume_monitor_adopt_orphan_mount") (GioMountClass.PolyML.cPtr --> GioVolumeClass.PolyML.cPtr)
      val get_ = call (getSymbol "g_volume_monitor_get") (cVoid --> GioVolumeMonitorClass.PolyML.cPtr)
      val getMountForUuid_ = call (getSymbol "g_volume_monitor_get_mount_for_uuid") (GioVolumeMonitorClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioMountClass.PolyML.cPtr)
      val getVolumeForUuid_ = call (getSymbol "g_volume_monitor_get_volume_for_uuid") (GioVolumeMonitorClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioVolumeClass.PolyML.cPtr)
    end
    type 'a class = 'a GioVolumeMonitorClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a mount_class = 'a GioMountClass.class
    type 'a volume_class = 'a GioVolumeClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun adoptOrphanMount mount = (GioMountClass.FFI.withPtr ---> GioVolumeClass.FFI.fromPtr true) adoptOrphanMount_ mount
    fun get () = (I ---> GioVolumeMonitorClass.FFI.fromPtr true) get_ ()
    fun getMountForUuid self uuid = (GioVolumeMonitorClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioMountClass.FFI.fromPtr true) getMountForUuid_ (self & uuid)
    fun getVolumeForUuid self uuid = (GioVolumeMonitorClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioVolumeClass.FFI.fromPtr true) getVolumeForUuid_ (self & uuid)
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
