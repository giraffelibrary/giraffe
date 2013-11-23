signature GIO_SOCKET_SERVICE =
  sig
    type 'a class_t
    type 'a socketconnectionclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val isActive : 'a class_t -> bool
    val start : 'a class_t -> unit
    val stop : 'a class_t -> unit
    val incomingSig :
      (base socketconnectionclass_t
        -> base GObject.ObjectClass.t
        -> bool)
       -> 'a class_t Signal.signal
  end
