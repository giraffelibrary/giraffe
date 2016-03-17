signature GIO_PROXY_ADDRESS =
  sig
    type 'a class
    type 'a socket_connectable_class
    type 'a inet_address_class
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val new :
      'a inet_address_class
       -> LargeInt.int
       -> string
       -> string
       -> LargeInt.int
       -> string option
       -> string option
       -> base class
    val getDestinationHostname : 'a class -> string
    val getDestinationPort : 'a class -> LargeInt.int
    val getPassword : 'a class -> string
    val getProtocol : 'a class -> string
    val getUsername : 'a class -> string
    val destinationHostnameProp : ('a class, string option, string option) Property.readwrite
    val destinationPortProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val passwordProp : ('a class, string option, string option) Property.readwrite
    val protocolProp : ('a class, string option, string option) Property.readwrite
    val usernameProp : ('a class, string option, string option) Property.readwrite
  end
