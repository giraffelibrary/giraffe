signature GIO_SOCKET =
  sig
    type 'a class
    type 'a datagram_based_class
    type 'a initable_class
    type 'a socket_connection_class
    type 'a credentials_class
    type 'a inet_address_class
    type 'a cancellable_class
    type socket_family_t
    type socket_protocol_t
    type 'a socket_address_class
    type socket_type_t
    type t = base class
    val asDatagramBased : 'a class -> base datagram_based_class
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
       -> unit
    val checkConnectResult : 'a class -> unit
    val close : 'a class -> unit
    val conditionCheck :
      'a class
       -> GLib.IOCondition.t
       -> GLib.IOCondition.t
    val conditionTimedWait :
      'a class
       -> GLib.IOCondition.t
           * LargeInt.int
           * 'b cancellable_class option
       -> unit
    val conditionWait :
      'a class
       -> GLib.IOCondition.t * 'b cancellable_class option
       -> unit
    val connect :
      'a class
       -> 'b socket_address_class * 'c cancellable_class option
       -> unit
    val connectionFactoryCreateConnection : 'a class -> base socket_connection_class
    val getAvailableBytes : 'a class -> LargeInt.int
    val getBlocking : 'a class -> bool
    val getBroadcast : 'a class -> bool
    val getCredentials : 'a class -> base credentials_class
    val getFamily : 'a class -> socket_family_t
    val getFd : 'a class -> LargeInt.int
    val getKeepalive : 'a class -> bool
    val getListenBacklog : 'a class -> LargeInt.int
    val getLocalAddress : 'a class -> base socket_address_class
    val getMulticastLoopback : 'a class -> bool
    val getMulticastTtl : 'a class -> LargeInt.int
    val getOption :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val getProtocol : 'a class -> socket_protocol_t
    val getRemoteAddress : 'a class -> base socket_address_class
    val getSocketType : 'a class -> socket_type_t
    val getTimeout : 'a class -> LargeInt.int
    val getTtl : 'a class -> LargeInt.int
    val isClosed : 'a class -> bool
    val isConnected : 'a class -> bool
    val joinMulticastGroup :
      'a class
       -> 'b inet_address_class
           * bool
           * string option
       -> unit
    val leaveMulticastGroup :
      'a class
       -> 'b inet_address_class
           * bool
           * string option
       -> unit
    val listen : 'a class -> unit
    val receive :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> LargeInt.int * GUInt8CArrayN.t
    val receiveFrom :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> LargeInt.int
           * base socket_address_class
           * GUInt8CArrayN.t
    val receiveWithBlocking :
      'a class
       -> LargeInt.int
           * bool
           * 'b cancellable_class option
       -> LargeInt.int * GUInt8CArrayN.t
    val send :
      'a class
       -> GUInt8CArrayN.t * 'b cancellable_class option
       -> LargeInt.int
    val sendTo :
      'a class
       -> 'b socket_address_class option
           * GUInt8CArrayN.t
           * 'c cancellable_class option
       -> LargeInt.int
    val sendWithBlocking :
      'a class
       -> GUInt8CArrayN.t
           * bool
           * 'b cancellable_class option
       -> LargeInt.int
    val setBlocking :
      'a class
       -> bool
       -> unit
    val setBroadcast :
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
    val setMulticastLoopback :
      'a class
       -> bool
       -> unit
    val setMulticastTtl :
      'a class
       -> LargeInt.int
       -> unit
    val setOption :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val setTimeout :
      'a class
       -> LargeInt.int
       -> unit
    val setTtl :
      'a class
       -> LargeInt.int
       -> unit
    val shutdown :
      'a class
       -> bool * bool
       -> unit
    val speaksIpv4 : 'a class -> bool
    val blockingProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val broadcastProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val familyProp : ('a class, unit -> socket_family_t, unit, socket_family_t -> unit) Property.t
    val fdProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
    val keepaliveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val listenBacklogProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val localAddressProp : ('a class, unit -> base socket_address_class option, unit, unit) Property.t
    val multicastLoopbackProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val multicastTtlProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val protocolProp : ('a class, unit -> socket_protocol_t, unit, socket_protocol_t -> unit) Property.t
    val remoteAddressProp : ('a class, unit -> base socket_address_class option, unit, unit) Property.t
    val timeoutProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val ttlProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val typeProp : ('a class, unit -> socket_type_t, unit, socket_type_t -> unit) Property.t
  end
