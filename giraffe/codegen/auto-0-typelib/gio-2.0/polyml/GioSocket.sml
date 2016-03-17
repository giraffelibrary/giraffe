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
      val getType_ = call (load_sym libgio "g_socket_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_socket_new")
          (
            GioSocketFamily.PolyML.cVal
             &&> GioSocketType.PolyML.cVal
             &&> GioSocketProtocol.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newFromFd_ = call (load_sym libgio "g_socket_new_from_fd") (FFI.Int32.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val accept_ =
        call (load_sym libgio "g_socket_accept")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val bind_ =
        call (load_sym libgio "g_socket_bind")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val checkConnectResult_ = call (load_sym libgio "g_socket_check_connect_result") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val close_ = call (load_sym libgio "g_socket_close") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val conditionCheck_ = call (load_sym libgio "g_socket_condition_check") (GObjectObjectClass.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibIOCondition.PolyML.cVal)
      val conditionWait_ =
        call (load_sym libgio "g_socket_condition_wait")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibIOCondition.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val connect_ =
        call (load_sym libgio "g_socket_connect")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val connectionFactoryCreateConnection_ = call (load_sym libgio "g_socket_connection_factory_create_connection") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getBlocking_ = call (load_sym libgio "g_socket_get_blocking") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCredentials_ = call (load_sym libgio "g_socket_get_credentials") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val getFamily_ = call (load_sym libgio "g_socket_get_family") (GObjectObjectClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getFd_ = call (load_sym libgio "g_socket_get_fd") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getKeepalive_ = call (load_sym libgio "g_socket_get_keepalive") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getListenBacklog_ = call (load_sym libgio "g_socket_get_listen_backlog") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getLocalAddress_ = call (load_sym libgio "g_socket_get_local_address") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val getProtocol_ = call (load_sym libgio "g_socket_get_protocol") (GObjectObjectClass.PolyML.cPtr --> GioSocketProtocol.PolyML.cVal)
      val getRemoteAddress_ = call (load_sym libgio "g_socket_get_remote_address") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val getSocketType_ = call (load_sym libgio "g_socket_get_socket_type") (GObjectObjectClass.PolyML.cPtr --> GioSocketType.PolyML.cVal)
      val getTimeout_ = call (load_sym libgio "g_socket_get_timeout") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val isClosed_ = call (load_sym libgio "g_socket_is_closed") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isConnected_ = call (load_sym libgio "g_socket_is_connected") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val listen_ = call (load_sym libgio "g_socket_listen") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val receive_ =
        call (load_sym libgio "g_socket_receive")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val receiveFrom_ =
        call (load_sym libgio "g_socket_receive_from")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val receiveWithBlocking_ =
        call (load_sym libgio "g_socket_receive_with_blocking")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val setBlocking_ = call (load_sym libgio "g_socket_set_blocking") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setKeepalive_ = call (load_sym libgio "g_socket_set_keepalive") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setListenBacklog_ = call (load_sym libgio "g_socket_set_listen_backlog") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTimeout_ = call (load_sym libgio "g_socket_set_timeout") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val shutdown_ =
        call (load_sym libgio "g_socket_shutdown")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val speaksIpv4_ = call (load_sym libgio "g_socket_speaks_ipv4") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun checkConnectResult self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) checkConnectResult_ (self & [])
    fun close self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) close_ (self & [])
    fun conditionCheck self condition = (GObjectObjectClass.C.withPtr &&&> GLibIOCondition.C.withVal ---> GLibIOCondition.C.fromVal) conditionCheck_ (self & condition)
    fun conditionWait self condition cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GLibIOCondition.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
    fun connectionFactoryCreateConnection self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectionClass.C.fromPtr true) connectionFactoryCreateConnection_ self
    fun getBlocking self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getBlocking_ self
    fun getCredentials self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioCredentialsClass.C.fromPtr true) getCredentials_ (self & [])
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun getKeepalive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getKeepalive_ self
    fun getListenBacklog self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getListenBacklog_ self
    fun getLocalAddress self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.C.fromPtr true) getLocalAddress_ (self & [])
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> GioSocketProtocol.C.fromVal) getProtocol_ self
    fun getRemoteAddress self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.C.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocketType self = (GObjectObjectClass.C.withPtr ---> GioSocketType.C.fromVal) getSocketType_ self
    fun getTimeout self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getTimeout_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun isConnected self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isConnected_ self
    fun listen self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) listen_ (self & [])
    fun receive self buffer size cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
    fun setBlocking self blocking = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setBlocking_ (self & blocking)
    fun setKeepalive self keepalive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setKeepalive_ (self & keepalive)
    fun setListenBacklog self backlog = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setListenBacklog_ (self & backlog)
    fun setTimeout self timeout = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setTimeout_ (self & timeout)
    fun shutdown self shutdownRead shutdownWrite =
      (
        GObjectObjectClass.C.withPtr
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
    fun speaksIpv4 self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) speaksIpv4_ self
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
