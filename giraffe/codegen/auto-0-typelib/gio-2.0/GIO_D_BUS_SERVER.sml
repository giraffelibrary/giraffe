signature GIO_D_BUS_SERVER =
  sig
    type 'a class_t
    type 'a initable_class_t
    type 'a cancellable_class_t
    type 'a d_bus_connection_class_t
    type 'a d_bus_auth_observer_class_t
    type d_bus_server_flags_t
    type t = base class_t
    val asInitable : 'a class_t -> base initable_class_t
    val getType : unit -> GObject.Type.t
    val newSync :
      string
       -> d_bus_server_flags_t
       -> string
       -> 'a d_bus_auth_observer_class_t
       -> 'b cancellable_class_t option
       -> base class_t
    val getClientAddress : 'a class_t -> string
    val getFlags : 'a class_t -> d_bus_server_flags_t
    val getGuid : 'a class_t -> string
    val isActive : 'a class_t -> bool
    val start : 'a class_t -> unit
    val stop : 'a class_t -> unit
    val newConnectionSig : (base d_bus_connection_class_t -> bool) -> 'a class_t Signal.signal
    val activeProp : ('a class_t, bool) Property.readonly
    val addressProp : ('a class_t, string option, string option) Property.readwrite
    val authenticationObserverProp : ('a class_t, base d_bus_auth_observer_class_t option, 'b d_bus_auth_observer_class_t option) Property.readwrite
    val clientAddressProp : ('a class_t, string option) Property.readonly
    val flagsProp : ('a class_t, d_bus_server_flags_t, d_bus_server_flags_t) Property.readwrite
    val guidProp : ('a class_t, string option, string option) Property.readwrite
  end
