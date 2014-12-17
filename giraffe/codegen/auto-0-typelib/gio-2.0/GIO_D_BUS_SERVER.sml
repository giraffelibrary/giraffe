signature GIO_D_BUS_SERVER =
  sig
    type 'a class_t
    type 'a initableclass_t
    type 'a cancellableclass_t
    type 'a dbusconnectionclass_t
    type 'a dbusauthobserverclass_t
    type dbusserverflags_t
    type t = base class_t
    val asInitable : 'a class_t -> base initableclass_t
    val getType : unit -> GObject.Type.t
    val newSync :
      string
       -> dbusserverflags_t
       -> string
       -> 'a dbusauthobserverclass_t
       -> 'b cancellableclass_t option
       -> base class_t
    val getClientAddress : 'a class_t -> string
    val getFlags : 'a class_t -> dbusserverflags_t
    val getGuid : 'a class_t -> string
    val isActive : 'a class_t -> bool
    val start : 'a class_t -> unit
    val stop : 'a class_t -> unit
    val newConnectionSig : (base dbusconnectionclass_t -> bool) -> 'a class_t Signal.signal
    val activeProp : ('a class_t, bool) Property.readonly
    val addressProp : ('a class_t, string option, string option) Property.readwrite
    val authenticationObserverProp : ('a class_t, base dbusauthobserverclass_t option, 'b dbusauthobserverclass_t option) Property.readwrite
    val clientAddressProp : ('a class_t, string option) Property.readonly
    val flagsProp : ('a class_t, dbusserverflags_t, dbusserverflags_t) Property.readwrite
    val guidProp : ('a class_t, string option, string option) Property.readwrite
  end
