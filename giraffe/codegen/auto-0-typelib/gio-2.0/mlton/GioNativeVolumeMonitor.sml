structure GioNativeVolumeMonitor :>
  GIO_NATIVE_VOLUME_MONITOR
    where type 'a class = 'a GioNativeVolumeMonitorClass.class =
  struct
    val getType_ = _import "g_native_volume_monitor_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GioNativeVolumeMonitorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
