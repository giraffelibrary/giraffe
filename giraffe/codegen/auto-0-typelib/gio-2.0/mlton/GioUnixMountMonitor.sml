structure GioUnixMountMonitor :>
  GIO_UNIX_MOUNT_MONITOR
    where type 'a class = 'a GioUnixMountMonitorClass.class =
  struct
    val getType_ = _import "g_unix_mount_monitor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_unix_mount_monitor_new" : unit -> GioUnixMountMonitorClass.FFI.notnull GioUnixMountMonitorClass.FFI.p;
    val get_ = _import "g_unix_mount_monitor_get" : unit -> GioUnixMountMonitorClass.FFI.notnull GioUnixMountMonitorClass.FFI.p;
    val setRateLimit_ = fn x1 & x2 => (_import "g_unix_mount_monitor_set_rate_limit" : GioUnixMountMonitorClass.FFI.notnull GioUnixMountMonitorClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
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
