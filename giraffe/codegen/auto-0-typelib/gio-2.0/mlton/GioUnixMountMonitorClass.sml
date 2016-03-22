structure GioUnixMountMonitorClass :>
  GIO_UNIX_MOUNT_MONITOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a unix_mount_monitor = unit
    type 'a class = 'a unix_mount_monitor class
  end
