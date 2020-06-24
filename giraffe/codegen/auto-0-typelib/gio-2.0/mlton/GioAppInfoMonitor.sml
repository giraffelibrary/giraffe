structure GioAppInfoMonitor :>
  GIO_APP_INFO_MONITOR
    where type 'a class = 'a GioAppInfoMonitorClass.class =
  struct
    val getType_ = _import "g_app_info_monitor_get_type" : unit -> GObjectType.FFI.val_;
    val get_ = _import "g_app_info_monitor_get" : unit -> GioAppInfoMonitorClass.FFI.non_opt GioAppInfoMonitorClass.FFI.p;
    type 'a class = 'a GioAppInfoMonitorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun get () = (I ---> GioAppInfoMonitorClass.FFI.fromPtr true) get_ ()
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
  end
