structure GioUnixMountMonitor :>
  GIO_UNIX_MOUNT_MONITOR
    where type 'a class = 'a GioUnixMountMonitorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_mount_monitor_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_mount_monitor_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val setRateLimit_ = call (load_sym libgio "g_unix_mount_monitor_set_rate_limit") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioUnixMountMonitorClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixMountMonitorClass.C.fromPtr true) new_ ()
    fun setRateLimit self limitMsec = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setRateLimit_ (self & limitMsec)
    local
      open ClosureMarshal Signal
    in
      fun mountpointsChangedSig f = signal "mountpoints-changed" (void ---> ret_void) f
      fun mountsChangedSig f = signal "mounts-changed" (void ---> ret_void) f
    end
  end
