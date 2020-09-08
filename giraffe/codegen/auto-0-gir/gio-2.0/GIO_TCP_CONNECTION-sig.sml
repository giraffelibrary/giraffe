signature GIO_TCP_CONNECTION =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getGracefulDisconnect : 'a class -> bool
    val setGracefulDisconnect :
      'a class
       -> bool
       -> unit
    val gracefulDisconnectProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
