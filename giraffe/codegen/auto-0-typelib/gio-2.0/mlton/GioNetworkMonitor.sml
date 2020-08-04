structure GioNetworkMonitor :>
  GIO_NETWORK_MONITOR
    where type 'a class = 'a GioNetworkMonitorClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type network_connectivity_t = GioNetworkConnectivity.t =
  struct
    val getType_ = _import "g_network_monitor_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "g_network_monitor_get_default" : unit -> GioNetworkMonitorClass.FFI.non_opt GioNetworkMonitorClass.FFI.p;
    val canReach_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_network_monitor_can_reach" :
              GioNetworkMonitorClass.FFI.non_opt GioNetworkMonitorClass.FFI.p
               * GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val canReachFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_network_monitor_can_reach_finish" :
              GioNetworkMonitorClass.FFI.non_opt GioNetworkMonitorClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getConnectivity_ = _import "g_network_monitor_get_connectivity" : GioNetworkMonitorClass.FFI.non_opt GioNetworkMonitorClass.FFI.p -> GioNetworkConnectivity.FFI.val_;
    val getNetworkAvailable_ = _import "g_network_monitor_get_network_available" : GioNetworkMonitorClass.FFI.non_opt GioNetworkMonitorClass.FFI.p -> GBool.FFI.val_;
    val getNetworkMetered_ = _import "g_network_monitor_get_network_metered" : GioNetworkMonitorClass.FFI.non_opt GioNetworkMonitorClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioNetworkMonitorClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type network_connectivity_t = GioNetworkConnectivity.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioNetworkMonitorClass.FFI.fromPtr false) getDefault_ ()
    fun canReach self (connectable, cancellable) =
      (
        GioNetworkMonitorClass.FFI.withPtr false
         &&&> GioSocketConnectableClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        canReach_
        (
          self
           & connectable
           & cancellable
           & []
        )
    fun canReachFinish self result =
      (
        GioNetworkMonitorClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        canReachFinish_
        (
          self
           & result
           & []
        )
    fun getConnectivity self = (GioNetworkMonitorClass.FFI.withPtr false ---> GioNetworkConnectivity.FFI.fromVal) getConnectivity_ self
    fun getNetworkAvailable self = (GioNetworkMonitorClass.FFI.withPtr false ---> GBool.FFI.fromVal) getNetworkAvailable_ self
    fun getNetworkMetered self = (GioNetworkMonitorClass.FFI.withPtr false ---> GBool.FFI.fromVal) getNetworkMetered_ self
    local
      open ClosureMarshal Signal
    in
      fun networkChangedSig f = signal "network-changed" (get 0w1 boolean ---> ret_void) f
    end
    local
      open Property
    in
      val connectivityProp = {get = fn x => get "connectivity" GioNetworkConnectivity.t x}
      val networkAvailableProp = {get = fn x => get "network-available" boolean x}
      val networkMeteredProp = {get = fn x => get "network-metered" boolean x}
    end
  end
