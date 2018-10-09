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
    val gracefulDisconnectProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
