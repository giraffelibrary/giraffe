signature GIO_NETWORK_MONITOR =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a socket_connectable_class
    type 'a async_result_class
    type network_connectivity_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val canReach :
      'a class
       -> 'b socket_connectable_class * 'c cancellable_class option
       -> unit
    val canReachFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val getConnectivity : 'a class -> network_connectivity_t
    val getNetworkAvailable : 'a class -> bool
    val getNetworkMetered : 'a class -> bool
    val networkChangedSig : (bool -> unit) -> 'a class Signal.t
    val connectivityProp : ('a class, unit -> network_connectivity_t, unit, unit) Property.t
    val networkAvailableProp : ('a class, unit -> bool, unit, unit) Property.t
    val networkMeteredProp : ('a class, unit -> bool, unit, unit) Property.t
  end
