signature GIO_D_BUS_SERVER =
  sig
    type 'a class
    type 'a initable_class
    type 'a cancellable_class
    type 'a d_bus_connection_class
    type 'a d_bus_auth_observer_class
    type d_bus_server_flags_t
    type t = base class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val newSync :
      string
       * d_bus_server_flags_t
       * string
       * 'a d_bus_auth_observer_class option
       * 'b cancellable_class option
       -> base class
    val getClientAddress : 'a class -> string
    val getFlags : 'a class -> d_bus_server_flags_t
    val getGuid : 'a class -> string
    val isActive : 'a class -> bool
    val start : 'a class -> unit
    val stop : 'a class -> unit
    val newConnectionSig : (base d_bus_connection_class -> bool) -> 'a class Signal.t
    val activeProp : ('a class, unit -> bool, unit, unit) Property.t
    val addressProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val authenticationObserverProp : ('a class, unit -> base d_bus_auth_observer_class option, unit, 'b d_bus_auth_observer_class option -> unit) Property.t
    val clientAddressProp : ('a class, unit -> string option, unit, unit) Property.t
    val flagsProp : ('a class, unit -> d_bus_server_flags_t, unit, d_bus_server_flags_t -> unit) Property.t
    val guidProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
  end
