structure GioNativeVolumeMonitorClass :>
  GIO_NATIVE_VOLUME_MONITOR_CLASS
    where type 'a volume_monitor_class_t = 'a GioVolumeMonitorClass.t
    where type C.notnull = GioVolumeMonitorClass.C.notnull
    where type 'a C.p = 'a GioVolumeMonitorClass.C.p =
  struct
    type 'a native_volume_monitor = unit
    type 'a volume_monitor_class_t = 'a GioVolumeMonitorClass.t
    type 'a t = 'a native_volume_monitor volume_monitor_class_t
    fun toBase obj = obj
    val t = GioVolumeMonitorClass.t
    val tOpt = GioVolumeMonitorClass.tOpt
    structure C = GioVolumeMonitorClass.C
  end
