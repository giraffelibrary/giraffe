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
    val destinationHostnameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val destinationPortProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val destinationProtocolProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val passwordProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val protocolProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val uriProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val usernameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
