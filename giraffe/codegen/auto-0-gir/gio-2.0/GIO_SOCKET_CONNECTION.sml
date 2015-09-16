signature GIO_SOCKET_CONNECTION =
  sig
    type 'a class_t
    type 'a socket_address_class_t
    type 'a socket_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getLocalAddress : 'a class_t -> base socket_address_class_t
    val getRemoteAddress : 'a class_t -> base socket_address_class_t
    val getSocket : 'a class_t -> base socket_class_t
    val socketProp : ('a class_t, base socket_class_t option, 'b socket_class_t option) Property.readwrite
  end
