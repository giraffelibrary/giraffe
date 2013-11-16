structure GioUnixMountMonitorClass :>
  GIO_UNIX_MOUNT_MONITOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a unixmountmonitor = unit
    type 'a t = 'a unixmountmonitor GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
