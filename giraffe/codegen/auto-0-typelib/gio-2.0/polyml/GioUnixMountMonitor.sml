structure GioUnixMountMonitor :>
  GIO_UNIX_MOUNT_MONITOR
    where type 'a class = 'a GioUnixMountMonitorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_mount_monitor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_unix_mount_monitor_new") (cVoid --> GioUnixMountMonitorClass.PolyML.cPtr)
      val get_ = call (getSymbol "g_unix_mount_monitor_get") (cVoid --> GioUnixMountMonitorClass.PolyML.cPtr)
      val setRateLimit_ = call (getSymbol "g_unix_mount_monitor_set_rate_limit") (GioUnixMountMonitorClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioUnixMountMonitorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixMountMonitorClass.FFI.fromPtr true) new_ ()
    fun get () = (I ---> GioUnixMountMonitorClass.FFI.fromPtr true) get_ ()
    fun setRateLimit self limitMsec = (GioUnixMountMonitorClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setRateLimit_ (self & limitMsec)
    local
      open ClosureMarshal Signal
    in
      fun mountpointsChangedSig f = signal "mountpoints-changed" (void ---> ret_void) f
      fun mountsChangedSig f = signal "mounts-changed" (void ---> ret_void) f
    end
  end
