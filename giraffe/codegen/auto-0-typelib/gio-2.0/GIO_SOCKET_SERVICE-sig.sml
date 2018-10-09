signature GIO_SOCKET_SERVICE =
  sig
    type 'a class
    type 'a socket_connection_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val isActive : 'a class -> bool
    val start : 'a class -> unit
    val stop : 'a class -> unit
    val incomingSig : (base socket_connection_class * base GObject.ObjectClass.class option -> bool) -> 'a class Signal.t
    val activeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
