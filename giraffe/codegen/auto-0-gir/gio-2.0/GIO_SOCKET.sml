signature GIO_SOCKET =
  sig
    type 'a class
    type 'a initable_class
    type 'a socket_connection_class
    type 'a credentials_class
    type 'a cancellable_class
    type socket_family_t
    type socket_protocol_t
    type 'a socket_address_class
    type socket_type_t
    type t = base class
    val asInitable : 'a class -> base initable_class
    val getType : unit -> GObject.Type.t
    val new :
      socket_family_t
       * socket_type_t
       * socket_protocol_t
       -> base class
    val newFromFd : LargeInt.int -> base class
    val accept :
      'a class
       -> 'b cancellable_class option
       -> base class
    val bind :
      'a class
       -> 'b socket_address_class * bool
       -> bool
    val checkConnectResult : 'a class -> bool
    val close : 'a class -> bool
    val conditionCheck :
      'a class
       -> GLib.IOCondition.t
       -> GLib.IOCondition.t
    val conditionWait :
      'a class
       -> GLib.IOCondition.t * 'b cancellable_class option
       -> bool
    val connect :
      'a class
       -> 'b socket_address_class * 'c cancellable_class option
       -> bool
    val connectionFactoryCreateConnection : 'a class -> base socket_connection_class
    val getBlocking : 'a class -> bool
    val getCredentials : 'a class -> base credentials_class
    val getFamily : 'a class -> socket_family_t
    val getFd : 'a class -> LargeInt.int
    val getKeepalive : 'a class -> bool
    val getListenBacklog : 'a class -> LargeInt.int
    val getLocalAddress : 'a class -> base socket_address_class
    val getProtocol : 'a class -> socket_protocol_t
    val getRemoteAddress : 'a class -> base socket_address_class
    val getSocketType : 'a class -> socket_type_t
    val getTimeout : 'a class -> LargeInt.int
    val isClosed : 'a class -> bool
    val isConnected : 'a class -> bool
    val listen : 'a class -> bool
    val receive :
      'a class
       -> string
           * LargeInt.int
           * 'b cancellable_class option
       -> LargeInt.int
    val receiveFrom :
      'a class
       -> 'b socket_address_class
           * string
           * LargeInt.int
           * 'c cancellable_class option
       -> LargeInt.int
    val receiveWithBlocking :
      'a class
       -> string
           * LargeInt.int
           * bool
           * 'b cancellable_class option
       -> LargeInt.int
    val send :
      'a class
       -> string list * 'b cancellable_class option
       -> LargeInt.int
    val sendTo :
      'a class
       -> 'b socket_address_class
           * string list
           * 'c cancellable_class option
       -> LargeInt.int
    val sendWithBlocking :
      'a class
       -> string list
           * bool
           * 'b cancellable_class option
       -> LargeInt.int
    val setBlocking :
      'a class
       -> bool
       -> unit
    val setKeepalive :
      'a class
       -> bool
       -> unit
    val setListenBacklog :
      'a class
       -> LargeInt.int
       -> unit
    val setTimeout :
      'a class
       -> LargeInt.int
       -> unit
    val shutdown :
      'a class
       -> bool * bool
       -> bool
    val speaksIpv4 : 'a class -> bool
    val blockingProp : ('a class, bool, bool) Property.readwrite
    val familyProp : ('a class, socket_family_t, socket_family_t) Property.readwrite
    val fdProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val keepaliveProp : ('a class, bool, bool) Property.readwrite
    val listenBacklogProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val localAddressProp : ('a class, base socket_address_class option) Property.readonly
    val protocolProp : ('a class, socket_protocol_t, socket_protocol_t) Property.readwrite
    val remoteAddressProp : ('a class, base socket_address_class option) Property.readonly
    val timeoutProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val typeProp : ('a class, socket_type_t, socket_type_t) Property.readwrite
  end
