structure GioUnixMountMonitor :>
  GIO_UNIX_MOUNT_MONITOR
    where type 'a class_t = 'a GioUnixMountMonitorClass.t =
  struct
    val getType_ = _import "g_unix_mount_monitor_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_unix_mount_monitor_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setRateLimit_ = fn x1 & x2 => (_import "g_unix_mount_monitor_set_rate_limit" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GioUnixMountMonitorClass.t
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
