signature GIO_UNIX_SOCKET_ADDRESS =
  sig
    type 'a class
    type 'a socket_connectable_class
    type unix_socket_address_type_t
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newAbstract : GCharCArrayN.t -> base class
    val newWithType : GCharCArrayN.t * unix_socket_address_type_t -> base class
    val abstractNamesSupported : unit -> bool
    val getAddressType : 'a class -> unix_socket_address_type_t
    val getIsAbstract : 'a class -> bool
    val getPath : 'a class -> string
    val getPathLen : 'a class -> LargeInt.int
    val abstractProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val addressTypeProp :
      {
        get : 'a class -> unix_socket_address_type_t,
        new : unix_socket_address_type_t -> 'a class Property.t
      }
    val pathProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
