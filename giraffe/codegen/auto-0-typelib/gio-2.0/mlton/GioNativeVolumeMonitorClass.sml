structure GioNativeVolumeMonitorClass :>
  GIO_NATIVE_VOLUME_MONITOR_CLASS
    where type 'a volume_monitor_class = 'a GioVolumeMonitorClass.class
    where type C.notnull = GioVolumeMonitorClass.C.notnull
    where type 'a C.p = 'a GioVolumeMonitorClass.C.p =
  struct
    type 'a volume_monitor_class = 'a GioVolumeMonitorClass.class
    open GioVolumeMonitorClass
    type 'a native_volume_monitor = unit
    type 'a class = 'a native_volume_monitor class
  end
