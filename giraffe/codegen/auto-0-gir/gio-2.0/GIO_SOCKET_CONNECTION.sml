signature GIO_SOCKET_CONNECTION =
  sig
    type 'a class_t
    type 'a socketaddressclass_t
    type 'a socketclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getLocalAddress : 'a class_t -> base socketaddressclass_t
    val getRemoteAddress : 'a class_t -> base socketaddressclass_t
    val getSocket : 'a class_t -> base socketclass_t
    val socketProp : ('a class_t, base socketclass_t option, 'b socketclass_t option) Property.readwrite
  end
