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
    val activeProp : {get : 'a class -> bool}
    val addressProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val authenticationObserverProp :
      {
        get : 'a class -> base d_bus_auth_observer_class option,
        new : 'b d_bus_auth_observer_class option -> 'a class Property.t
      }
    val clientAddressProp : {get : 'a class -> string option}
    val flagsProp :
      {
        get : 'a class -> d_bus_server_flags_t,
        new : d_bus_server_flags_t -> 'a class Property.t
      }
    val guidProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
