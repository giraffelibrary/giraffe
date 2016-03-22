structure GioVolumeMonitor :>
  GIO_VOLUME_MONITOR
    where type 'a class = 'a GioVolumeMonitorClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a volume_class = 'a GioVolumeClass.class =
  struct
    val getType_ = _import "g_volume_monitor_get_type" : unit -> GObjectType.C.val_;
    val get_ = _import "g_volume_monitor_get" : unit -> GioVolumeMonitorClass.C.notnull GioVolumeMonitorClass.C.p;
    val getMountForUuid_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_volume_monitor_get_mount_for_uuid" :
              GioVolumeMonitorClass.C.notnull GioVolumeMonitorClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioMountClass.C.notnull GioMountClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getVolumeForUuid_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_volume_monitor_get_volume_for_uuid" :
              GioVolumeMonitorClass.C.notnull GioVolumeMonitorClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioVolumeClass.C.notnull GioVolumeClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioVolumeMonitorClass.class
    type 'a drive_class = 'a GioDriveClass.class
    type 'a mount_class = 'a GioMountClass.class
    type 'a volume_class = 'a GioVolumeClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun get () = (I ---> GioVolumeMonitorClass.C.fromPtr true) get_ ()
    fun getMountForUuid self uuid = (GioVolumeMonitorClass.C.withPtr &&&> Utf8.C.withPtr ---> GioMountClass.C.fromPtr true) getMountForUuid_ (self & uuid)
    fun getVolumeForUuid self uuid = (GioVolumeMonitorClass.C.withPtr &&&> Utf8.C.withPtr ---> GioVolumeClass.C.fromPtr true) getVolumeForUuid_ (self & uuid)
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
