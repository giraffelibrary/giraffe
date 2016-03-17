signature GIO_SOCKET_CONNECTION =
  sig
    type 'a class
    type 'a socket_address_class
    type 'a socket_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getLocalAddress : 'a class -> base socket_address_class
    val getRemoteAddress : 'a class -> base socket_address_class
    val getSocket : 'a class -> base socket_class
    val socketProp : ('a class, base socket_class option, 'b socket_class option) Property.readwrite
  end
