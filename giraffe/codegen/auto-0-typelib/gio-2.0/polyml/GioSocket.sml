structure GioSocket :>
  GIO_SOCKET
    where type 'a class = 'a GioSocketClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type socket_family_t = GioSocketFamily.t
    where type socket_protocol_t = GioSocketProtocol.t
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type socket_type_t = GioSocketType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_socket_new")
          (
            GioSocketFamily.PolyML.cVal
             &&> GioSocketType.PolyML.cVal
             &&> GioSocketProtocol.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketClass.PolyML.cPtr
          )
      val newFromFd_ = call (load_sym libgio "g_socket_new_from_fd") (FFI.Int32.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketClass.PolyML.cPtr)
      val accept_ =
        call (load_sym libgio "g_socket_accept")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketClass.PolyML.cPtr
          )
      val bind_ =
        call (load_sym libgio "g_socket_bind")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val checkConnectResult_ = call (load_sym libgio "g_socket_check_connect_result") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val close_ = call (load_sym libgio "g_socket_close") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val conditionCheck_ = call (load_sym libgio "g_socket_condition_check") (GioSocketClass.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibIOCondition.PolyML.cVal)
      val conditionWait_ =
        call (load_sym libgio "g_socket_condition_wait")
          (
            GioSocketClass.PolyML.cPtr
             &&> GLibIOCondition.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val connect_ =
        call (load_sym libgio "g_socket_connect")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val connectionFactoryCreateConnection_ = call (load_sym libgio "g_socket_connection_factory_create_connection") (GioSocketClass.PolyML.cPtr --> GioSocketConnectionClass.PolyML.cPtr)
      val getBlocking_ = call (load_sym libgio "g_socket_get_blocking") (GioSocketClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCredentials_ = call (load_sym libgio "g_socket_get_credentials") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioCredentialsClass.PolyML.cPtr)
      val getFamily_ = call (load_sym libgio "g_socket_get_family") (GioSocketClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getFd_ = call (load_sym libgio "g_socket_get_fd") (GioSocketClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getKeepalive_ = call (load_sym libgio "g_socket_get_keepalive") (GioSocketClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getListenBacklog_ = call (load_sym libgio "g_socket_get_listen_backlog") (GioSocketClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getLocalAddress_ = call (load_sym libgio "g_socket_get_local_address") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getProtocol_ = call (load_sym libgio "g_socket_get_protocol") (GioSocketClass.PolyML.cPtr --> GioSocketProtocol.PolyML.cVal)
      val getRemoteAddress_ = call (load_sym libgio "g_socket_get_remote_address") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getSocketType_ = call (load_sym libgio "g_socket_get_socket_type") (GioSocketClass.PolyML.cPtr --> GioSocketType.PolyML.cVal)
      val getTimeout_ = call (load_sym libgio "g_socket_get_timeout") (GioSocketClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val isClosed_ = call (load_sym libgio "g_socket_is_closed") (GioSocketClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isConnected_ = call (load_sym libgio "g_socket_is_connected") (GioSocketClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val listen_ = call (load_sym libgio "g_socket_listen") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val receive_ =
        call (load_sym libgio "g_socket_receive")
          (
            GioSocketClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val receiveFrom_ =
        call (load_sym libgio "g_socket_receive_from")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val receiveWithBlocking_ =
        call (load_sym libgio "g_socket_receive_with_blocking")
          (
            GioSocketClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val setBlocking_ = call (load_sym libgio "g_socket_set_blocking") (GioSocketClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setKeepalive_ = call (load_sym libgio "g_socket_set_keepalive") (GioSocketClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setListenBacklog_ = call (load_sym libgio "g_socket_set_listen_backlog") (GioSocketClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTimeout_ = call (load_sym libgio "g_socket_set_timeout") (GioSocketClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val shutdown_ =
        call (load_sym libgio "g_socket_shutdown")
          (
            GioSocketClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val speaksIpv4_ = call (load_sym libgio "g_socket_speaks_ipv4") (GioSocketClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioSocketClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type socket_family_t = GioSocketFamily.t
    type socket_protocol_t = GioSocketProtocol.t
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type socket_type_t = GioSocketType.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new family type' protocol =
      (
        GioSocketFamily.C.withVal
         &&&> GioSocketType.C.withVal
         &&&> GioSocketProtocol.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSocketClass.C.fromPtr true
      )
        new_
        (
          family
           & type'
           & protocol
           & []
        )
    fun newFromFd fd = (FFI.Int32.C.withVal &&&> GLibErrorRecord.handleError ---> GioSocketClass.C.fromPtr true) newFromFd_ (fd & [])
    fun accept self cancellable =
      (
        GioSocketClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketClass.C.fromPtr true
      )
        accept_
        (
          self
           & cancellable
           & []
        )
    fun bind self address allowReuse =
      (
        GioSocketClass.C.withPtr
         &&&> GioSocketAddressClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        bind_
        (
          self
           & address
           & allowReuse
           & []
        )
    fun checkConnectResult self = (GioSocketClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) checkConnectResult_ (self & [])
    fun close self = (GioSocketClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) close_ (self & [])
    fun conditionCheck self condition = (GioSocketClass.C.withPtr &&&> GLibIOCondition.C.withVal ---> GLibIOCondition.C.fromVal) conditionCheck_ (self & condition)
    fun conditionWait self condition cancellable =
      (
        GioSocketClass.C.withPtr
         &&&> GLibIOCondition.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        conditionWait_
        (
          self
           & condition
           & cancellable
           & []
        )
    fun connect self address cancellable =
      (
        GioSocketClass.C.withPtr
         &&&> GioSocketAddressClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        connect_
        (
          self
           & address
           & cancellable
           & []
        )
    fun connectionFactoryCreateConnection self = (GioSocketClass.C.withPtr ---> GioSocketConnectionClass.C.fromPtr true) connectionFactoryCreateConnection_ self
    fun getBlocking self = (GioSocketClass.C.withPtr ---> FFI.Bool.C.fromVal) getBlocking_ self
    fun getCredentials self = (GioSocketClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioCredentialsClass.C.fromPtr true) getCredentials_ (self & [])
    fun getFamily self = (GioSocketClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getFd self = (GioSocketClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun getKeepalive self = (GioSocketClass.C.withPtr ---> FFI.Bool.C.fromVal) getKeepalive_ self
    fun getListenBacklog self = (GioSocketClass.C.withPtr ---> FFI.Int32.C.fromVal) getListenBacklog_ self
    fun getLocalAddress self = (GioSocketClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.C.fromPtr true) getLocalAddress_ (self & [])
    fun getProtocol self = (GioSocketClass.C.withPtr ---> GioSocketProtocol.C.fromVal) getProtocol_ self
    fun getRemoteAddress self = (GioSocketClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.C.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocketType self = (GioSocketClass.C.withPtr ---> GioSocketType.C.fromVal) getSocketType_ self
    fun getTimeout self = (GioSocketClass.C.withPtr ---> FFI.UInt32.C.fromVal) getTimeout_ self
    fun isClosed self = (GioSocketClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun isConnected self = (GioSocketClass.C.withPtr ---> FFI.Bool.C.fromVal) isConnected_ self
    fun listen self = (GioSocketClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) listen_ (self & [])
    fun receive self buffer size cancellable =
      (
        GioSocketClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
      )
        receive_
        (
          self
           & buffer
           & size
           & cancellable
           & []
        )
    fun receiveFrom self address buffer size cancellable =
      (
        GioSocketClass.C.withPtr
         &&&> GioSocketAddressClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
      )
        receiveFrom_
        (
          self
           & address
           & buffer
           & size
           & cancellable
           & []
        )
    fun receiveWithBlocking self buffer size blocking cancellable =
      (
        GioSocketClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
      )
        receiveWithBlocking_
        (
          self
           & buffer
           & size
           & blocking
           & cancellable
           & []
        )
    fun setBlocking self blocking = (GioSocketClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setBlocking_ (self & blocking)
    fun setKeepalive self keepalive = (GioSocketClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepalive_ (self & keepalive)
    fun setListenBacklog self backlog = (GioSocketClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setListenBacklog_ (self & backlog)
    fun setTimeout self timeout = (GioSocketClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setTimeout_ (self & timeout)
    fun shutdown self shutdownRead shutdownWrite =
      (
        GioSocketClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        shutdown_
        (
          self
           & shutdownRead
           & shutdownWrite
           & []
        )
    fun speaksIpv4 self = (GioSocketClass.C.withPtr ---> FFI.Bool.C.fromVal) speaksIpv4_ self
    local
      open Property
    in
      val blockingProp =
        {
          get = fn x => get "blocking" boolean x,
          set = fn x => set "blocking" boolean x
        }
      val familyProp =
        {
          get = fn x => get "family" GioSocketFamily.t x,
          set = fn x => set "family" GioSocketFamily.t x
        }
      val fdProp =
        {
          get = fn x => get "fd" int x,
          set = fn x => set "fd" int x
        }
      val keepaliveProp =
        {
          get = fn x => get "keepalive" boolean x,
          set = fn x => set "keepalive" boolean x
        }
      val listenBacklogProp =
        {
          get = fn x => get "listen-backlog" int x,
          set = fn x => set "listen-backlog" int x
        }
      val localAddressProp = {get = fn x => get "local-address" GioSocketAddressClass.tOpt x}
      val protocolProp =
        {
          get = fn x => get "protocol" GioSocketProtocol.t x,
          set = fn x => set "protocol" GioSocketProtocol.t x
        }
      val remoteAddressProp = {get = fn x => get "remote-address" GioSocketAddressClass.tOpt x}
      val timeoutProp =
        {
          get = fn x => get "timeout" uint x,
          set = fn x => set "timeout" uint x
        }
      val typeProp =
        {
          get = fn x => get "type" GioSocketType.t x,
          set = fn x => set "type" GioSocketType.t x
        }
    end
  end
