signature GIO_UNIX_SOCKET_ADDRESS =
  sig
    type 'a class
    type 'a socket_connectable_class
    type unix_socket_address_type_t
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val abstractNamesSupported : unit -> bool
    val getAddressType : 'a class -> unix_socket_address_type_t
    val getPath : 'a class -> string
    val getPathLen : 'a class -> LargeInt.int
    val addressTypeProp : ('a class, unix_socket_address_type_t, unix_socket_address_type_t) Property.readwrite
    val pathProp : ('a class, string option, string option) Property.readwrite
  end
