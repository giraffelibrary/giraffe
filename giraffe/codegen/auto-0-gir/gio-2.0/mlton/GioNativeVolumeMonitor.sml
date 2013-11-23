structure GioNativeVolumeMonitor :>
  GIO_NATIVE_VOLUME_MONITOR
    where type 'a class_t = 'a GioNativeVolumeMonitorClass.t =
  struct
    val getType_ = _import "g_native_volume_monitor_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GioNativeVolumeMonitorClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
