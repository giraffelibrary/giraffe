structure GioVolumeMonitorClass :>
  GIO_VOLUME_MONITOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a volume_monitor = unit
    type 'a class = 'a volume_monitor class
  end
