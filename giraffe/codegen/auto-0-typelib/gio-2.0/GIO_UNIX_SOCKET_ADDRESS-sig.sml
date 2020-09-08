signature GIO_UNIX_SOCKET_ADDRESS =
  sig
    type 'a class
    type 'a socket_connectable_class
    type unix_socket_address_type_t
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newAbstract : GInt8CArrayN.t -> base class
    val newWithType : GInt8CArrayN.t * unix_socket_address_type_t -> base class
    val abstractNamesSupported : unit -> bool
    val getAddressType : 'a class -> unix_socket_address_type_t
    val getIsAbstract : 'a class -> bool
    val getPath : 'a class -> string
    val getPathLen : 'a class -> LargeInt.int
    val abstractProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val addressTypeProp : ('a class, unit -> unix_socket_address_type_t, unit, unix_socket_address_type_t -> unit) Property.t
    val pathProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
  end
