signature GIO_SOCKET_SERVICE =
  sig
    type 'a class_t
    type 'a socket_connection_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val isActive : 'a class_t -> bool
    val start : 'a class_t -> unit
    val stop : 'a class_t -> unit
    val incomingSig :
      (base socket_connection_class_t
        -> base GObject.ObjectClass.t
        -> bool)
       -> 'a class_t Signal.signal
  end
