signature GIO_SOCKET_CONNECTABLE =
  sig
    type 'a class
    type 'a socket_address_enumerator_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val enumerate : 'a class -> base socket_address_enumerator_class
    val proxyEnumerate : 'a class -> base socket_address_enumerator_class
  end
