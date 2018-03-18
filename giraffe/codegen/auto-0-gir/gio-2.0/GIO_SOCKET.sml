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
       -> Word8Vector.vector * 'b cancellable_class option
       -> LargeInt.int
    val receiveFrom :
      'a class
       -> Word8Vector.vector * 'b cancellable_class option
       -> LargeInt.int * base socket_address_class
    val receiveWithBlocking :
      'a class
       -> Word8Vector.vector
           * bool
           * 'b cancellable_class option
       -> LargeInt.int
    val send :
      'a class
       -> Word8Vector.vector * 'b cancellable_class option
       -> LargeInt.int
    val sendTo :
      'a class
       -> 'b socket_address_class option
           * Word8Vector.vector
           * 'c cancellable_class option
       -> LargeInt.int
    val sendWithBlocking :
      'a class
       -> Word8Vector.vector
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
    val blockingProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val broadcastProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val familyProp :
      {
        get : 'a class -> socket_family_t,
        new : socket_family_t -> 'a class Property.t
      }
    val fdProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val keepaliveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val listenBacklogProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val localAddressProp : {get : 'a class -> base socket_address_class option}
    val multicastLoopbackProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val multicastTtlProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val protocolProp :
      {
        get : 'a class -> socket_protocol_t,
        new : socket_protocol_t -> 'a class Property.t
      }
    val remoteAddressProp : {get : 'a class -> base socket_address_class option}
    val timeoutProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val ttlProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val typeProp :
      {
        get : 'a class -> socket_type_t,
        new : socket_type_t -> 'a class Property.t
      }
  end
