signature GIO_TCP_CONNECTION =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getGracefulDisconnect : 'a class_t -> bool
    val setGracefulDisconnect :
      'a class_t
       -> bool
       -> unit
    val gracefulDisconnectProp : ('a class_t, bool, bool) Property.readwrite
  end
