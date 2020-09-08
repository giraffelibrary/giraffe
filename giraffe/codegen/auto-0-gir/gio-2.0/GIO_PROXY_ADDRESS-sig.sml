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
       * LargeInt.int
       * string
       * string
       * LargeInt.int
       * string option
       * string option
       -> base class
    val getDestinationHostname : 'a class -> string
    val getDestinationPort : 'a class -> LargeInt.int
    val getDestinationProtocol : 'a class -> string
    val getPassword : 'a class -> string
    val getProtocol : 'a class -> string
    val getUri : 'a class -> string
    val getUsername : 'a class -> string
    val destinationHostnameProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val destinationPortProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
    val destinationProtocolProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val passwordProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val protocolProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val uriProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val usernameProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
  end
