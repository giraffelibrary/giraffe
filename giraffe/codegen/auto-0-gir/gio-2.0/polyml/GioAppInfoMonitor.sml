structure GioAppInfoMonitor :>
  GIO_APP_INFO_MONITOR
    where type 'a class = 'a GioAppInfoMonitorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_app_info_monitor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val get_ = call (getSymbol "g_app_info_monitor_get") (cVoid --> GioAppInfoMonitorClass.PolyML.cPtr)
    end
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
