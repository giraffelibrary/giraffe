structure GioVolumeMonitor :>
  GIO_VOLUME_MONITOR
    where type 'a class = 'a GioVolumeMonitorClass.class
    where type 'a drive_class = 'a GioDriveClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a volume_class = 'a GioVolumeClass.class =
  struct
    val getType_ = _import "g_volume_monitor_get_type" : unit -> GObjectType.FFI.val_;
    val adoptOrphanMount_ = _import "g_volume_monitor_adopt_orphan_mount" : GioMountClass.FFI.non_opt GioMountClass.FFI.p -> GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p;
    val get_ = _import "g_volume_monitor_get" : unit -> GioVolumeMonitorClass.FFI.non_opt GioVolumeMonitorClass.FFI.p;
    val getMountForUuid_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_volume_monitor_get_mount_for_uuid" :
              GioVolumeMonitorClass.FFI.non_opt GioVolumeMonitorClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioMountClass.FFI.non_opt GioMountClass.FFI.p;
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
              GioVolumeMonitorClass.FFI.non_opt GioVolumeMonitorClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioVolumeClass.FFI.non_opt GioVolumeClass.FFI.p;
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun adoptOrphanMount mount = (GioMountClass.FFI.withPtr false ---> GioVolumeClass.FFI.fromPtr true) adoptOrphanMount_ mount
    fun get () = (I ---> GioVolumeMonitorClass.FFI.fromPtr true) get_ ()
    fun getMountForUuid self uuid = (GioVolumeMonitorClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioMountClass.FFI.fromPtr true) getMountForUuid_ (self & uuid)
    fun getVolumeForUuid self uuid = (GioVolumeMonitorClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioVolumeClass.FFI.fromPtr true) getVolumeForUuid_ (self & uuid)
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
