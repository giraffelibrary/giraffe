structure GioNativeVolumeMonitorClass :>
  GIO_NATIVE_VOLUME_MONITOR_CLASS
    where type 'a volumemonitorclass_t = 'a GioVolumeMonitorClass.t
    where type C.notnull = GioVolumeMonitorClass.C.notnull
    where type 'a C.p = 'a GioVolumeMonitorClass.C.p =
  struct
    type 'a nativevolumemonitor = unit
    type 'a volumemonitorclass_t = 'a GioVolumeMonitorClass.t
    type 'a t = 'a nativevolumemonitor volumemonitorclass_t
    fun toBase obj = obj
    val t = GioVolumeMonitorClass.t
    val tOpt = GioVolumeMonitorClass.tOpt
    structure C = GioVolumeMonitorClass.C
  end
