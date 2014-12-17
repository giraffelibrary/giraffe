signature GIO_SOCKET =
  sig
    type 'a class_t
    type 'a initableclass_t
    type 'a socketconnectionclass_t
    type 'a credentialsclass_t
    type 'a cancellableclass_t
    type socketfamily_t
    type socketprotocol_t
    type 'a socketaddressclass_t
    type sockettype_t
    type t = base class_t
    val asInitable : 'a class_t -> base initableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      socketfamily_t
       -> sockettype_t
       -> socketprotocol_t
       -> base class_t
    val newFromFd : LargeInt.int -> base class_t
    val accept :
      'a class_t
       -> 'b cancellableclass_t option
       -> base class_t
    val bind :
      'a class_t
       -> 'b socketaddressclass_t
       -> bool
       -> bool
    val checkConnectResult : 'a class_t -> bool
    val close : 'a class_t -> bool
    val conditionCheck :
      'a class_t
       -> GLib.IOCondition.t
       -> GLib.IOCondition.t
    val conditionWait :
      'a class_t
       -> GLib.IOCondition.t
       -> 'b cancellableclass_t option
       -> bool
    val connect :
      'a class_t
       -> 'b socketaddressclass_t
       -> 'c cancellableclass_t option
       -> bool
    val connectionFactoryCreateConnection : 'a class_t -> base socketconnectionclass_t
    val getBlocking : 'a class_t -> bool
    val getCredentials : 'a class_t -> base credentialsclass_t
    val getFamily : 'a class_t -> socketfamily_t
    val getFd : 'a class_t -> LargeInt.int
    val getKeepalive : 'a class_t -> bool
    val getListenBacklog : 'a class_t -> LargeInt.int
    val getLocalAddress : 'a class_t -> base socketaddressclass_t
    val getProtocol : 'a class_t -> socketprotocol_t
    val getRemoteAddress : 'a class_t -> base socketaddressclass_t
    val getSocketType : 'a class_t -> sockettype_t
    val getTimeout : 'a class_t -> LargeInt.int
    val isClosed : 'a class_t -> bool
    val isConnected : 'a class_t -> bool
    val listen : 'a class_t -> bool
    val receive :
      'a class_t
       -> string
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val receiveFrom :
      'a class_t
       -> 'b socketaddressclass_t
       -> string
       -> LargeInt.int
       -> 'c cancellableclass_t option
       -> LargeInt.int
    val receiveWithBlocking :
      'a class_t
       -> string
       -> LargeInt.int
       -> bool
       -> 'b cancellableclass_t option
       -> LargeInt.int
    val setBlocking :
      'a class_t
       -> bool
       -> unit
    val setKeepalive :
      'a class_t
       -> bool
       -> unit
    val setListenBacklog :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTimeout :
      'a class_t
       -> LargeInt.int
       -> unit
    val shutdown :
      'a class_t
       -> bool
       -> bool
       -> bool
    val speaksIpv4 : 'a class_t -> bool
    val blockingProp : ('a class_t, bool, bool) Property.readwrite
    val familyProp : ('a class_t, socketfamily_t, socketfamily_t) Property.readwrite
    val fdProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val keepaliveProp : ('a class_t, bool, bool) Property.readwrite
    val listenBacklogProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val localAddressProp : ('a class_t, base socketaddressclass_t option) Property.readonly
    val protocolProp : ('a class_t, socketprotocol_t, socketprotocol_t) Property.readwrite
    val remoteAddressProp : ('a class_t, base socketaddressclass_t option) Property.readonly
    val timeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val typeProp : ('a class_t, sockettype_t, sockettype_t) Property.readwrite
  end
