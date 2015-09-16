signature GIO_SOCKET_CONNECTABLE =
  sig
    type 'a class_t
    type 'a socket_address_enumerator_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val enumerate : 'a class_t -> base socket_address_enumerator_class_t
    val proxyEnumerate : 'a class_t -> base socket_address_enumerator_class_t
  end
