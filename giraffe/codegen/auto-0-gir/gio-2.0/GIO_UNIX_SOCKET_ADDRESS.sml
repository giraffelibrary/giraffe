signature GIO_UNIX_SOCKET_ADDRESS =
  sig
    type 'a class_t
    type 'a socket_connectable_class_t
    type unix_socket_address_type_t
    type t = base class_t
    val asSocketConnectable : 'a class_t -> base socket_connectable_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val abstractNamesSupported : unit -> bool
    val getAddressType : 'a class_t -> unix_socket_address_type_t
    val getPath : 'a class_t -> string
    val getPathLen : 'a class_t -> LargeInt.int
    val addressTypeProp : ('a class_t, unix_socket_address_type_t, unix_socket_address_type_t) Property.readwrite
    val pathProp : ('a class_t, string option, string option) Property.readwrite
  end
