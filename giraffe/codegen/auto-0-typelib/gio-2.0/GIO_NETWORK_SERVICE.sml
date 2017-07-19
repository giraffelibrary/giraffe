signature GIO_NETWORK_SERVICE =
  sig
    type 'a class
    type 'a socket_connectable_class
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       * string
       * string
       -> base socket_connectable_class
    val getDomain : 'a class -> string
    val getProtocol : 'a class -> string
    val getScheme : 'a class -> string
    val getService : 'a class -> string
    val setScheme :
      'a class
       -> string
       -> unit
    val domainProp : ('a class, string option, string option) Property.readwrite
    val protocolProp : ('a class, string option, string option) Property.readwrite
    val schemeProp : ('a class, string option, string option) Property.readwrite
    val serviceProp : ('a class, string option, string option) Property.readwrite
  end
