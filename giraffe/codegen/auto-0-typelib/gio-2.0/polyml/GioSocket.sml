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
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_socket_new")
          (
            GioSocketFamily.PolyML.cVal
             &&> GioSocketType.PolyML.cVal
             &&> GioSocketProtocol.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketClass.PolyML.cPtr
          )
      val newFromFd_ = call (getSymbol "g_socket_new_from_fd") (GInt32.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketClass.PolyML.cPtr)
      val accept_ =
        call (getSymbol "g_socket_accept")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketClass.PolyML.cPtr
          )
      val bind_ =
        call (getSymbol "g_socket_bind")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val checkConnectResult_ = call (getSymbol "g_socket_check_connect_result") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val close_ = call (getSymbol "g_socket_close") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val conditionCheck_ = call (getSymbol "g_socket_condition_check") (GioSocketClass.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibIOCondition.PolyML.cVal)
      val conditionWait_ =
        call (getSymbol "g_socket_condition_wait")
          (
            GioSocketClass.PolyML.cPtr
             &&> GLibIOCondition.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val connect_ =
        call (getSymbol "g_socket_connect")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val connectionFactoryCreateConnection_ = call (getSymbol "g_socket_connection_factory_create_connection") (GioSocketClass.PolyML.cPtr --> GioSocketConnectionClass.PolyML.cPtr)
      val getBlocking_ = call (getSymbol "g_socket_get_blocking") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCredentials_ = call (getSymbol "g_socket_get_credentials") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioCredentialsClass.PolyML.cPtr)
      val getFamily_ = call (getSymbol "g_socket_get_family") (GioSocketClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getFd_ = call (getSymbol "g_socket_get_fd") (GioSocketClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getKeepalive_ = call (getSymbol "g_socket_get_keepalive") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getListenBacklog_ = call (getSymbol "g_socket_get_listen_backlog") (GioSocketClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getLocalAddress_ = call (getSymbol "g_socket_get_local_address") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getProtocol_ = call (getSymbol "g_socket_get_protocol") (GioSocketClass.PolyML.cPtr --> GioSocketProtocol.PolyML.cVal)
      val getRemoteAddress_ = call (getSymbol "g_socket_get_remote_address") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getSocketType_ = call (getSymbol "g_socket_get_socket_type") (GioSocketClass.PolyML.cPtr --> GioSocketType.PolyML.cVal)
      val getTimeout_ = call (getSymbol "g_socket_get_timeout") (GioSocketClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val isClosed_ = call (getSymbol "g_socket_is_closed") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isConnected_ = call (getSymbol "g_socket_is_connected") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val listen_ = call (getSymbol "g_socket_listen") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val receive_ =
        call (getSymbol "g_socket_receive")
          (
            GioSocketClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val receiveFrom_ =
        call (getSymbol "g_socket_receive_from")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val receiveWithBlocking_ =
        call (getSymbol "g_socket_receive_with_blocking")
          (
            GioSocketClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val send_ =
        call (getSymbol "g_socket_send")
          (
            GioSocketClass.PolyML.cPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val sendTo_ =
        call (getSymbol "g_socket_send_to")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val sendWithBlocking_ =
        call (getSymbol "g_socket_send_with_blocking")
          (
            GioSocketClass.PolyML.cPtr
             &&> Utf8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val setBlocking_ = call (getSymbol "g_socket_set_blocking") (GioSocketClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setKeepalive_ = call (getSymbol "g_socket_set_keepalive") (GioSocketClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setListenBacklog_ = call (getSymbol "g_socket_set_listen_backlog") (GioSocketClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setTimeout_ = call (getSymbol "g_socket_set_timeout") (GioSocketClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val shutdown_ =
        call (getSymbol "g_socket_shutdown")
          (
            GioSocketClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val speaksIpv4_ = call (getSymbol "g_socket_speaks_ipv4") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
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
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        family,
        type',
        protocol
      ) =
      (
        GioSocketFamily.FFI.withVal
         &&&> GioSocketType.FFI.withVal
         &&&> GioSocketProtocol.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioSocketClass.FFI.fromPtr true
      )
        new_
        (
          family
           & type'
           & protocol
           & []
        )
    fun newFromFd fd = (GInt32.FFI.withVal &&&> GLibErrorRecord.handleError ---> GioSocketClass.FFI.fromPtr true) newFromFd_ (fd & [])
    fun accept self cancellable =
      (
        GioSocketClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketClass.FFI.fromPtr true
      )
        accept_
        (
          self
           & cancellable
           & []
        )
    fun bind self (address, allowReuse) =
      (
        GioSocketClass.FFI.withPtr
         &&&> GioSocketAddressClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        bind_
        (
          self
           & address
           & allowReuse
           & []
        )
    fun checkConnectResult self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) checkConnectResult_ (self & [])
    fun close self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) close_ (self & [])
    fun conditionCheck self condition = (GioSocketClass.FFI.withPtr &&&> GLibIOCondition.FFI.withVal ---> GLibIOCondition.FFI.fromVal) conditionCheck_ (self & condition)
    fun conditionWait self (condition, cancellable) =
      (
        GioSocketClass.FFI.withPtr
         &&&> GLibIOCondition.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        conditionWait_
        (
          self
           & condition
           & cancellable
           & []
        )
    fun connect self (address, cancellable) =
      (
        GioSocketClass.FFI.withPtr
         &&&> GioSocketAddressClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        connect_
        (
          self
           & address
           & cancellable
           & []
        )
    fun connectionFactoryCreateConnection self = (GioSocketClass.FFI.withPtr ---> GioSocketConnectionClass.FFI.fromPtr true) connectionFactoryCreateConnection_ self
    fun getBlocking self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) getBlocking_ self
    fun getCredentials self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioCredentialsClass.FFI.fromPtr true) getCredentials_ (self & [])
    fun getFamily self = (GioSocketClass.FFI.withPtr ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getFd self = (GioSocketClass.FFI.withPtr ---> GInt32.FFI.fromVal) getFd_ self
    fun getKeepalive self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) getKeepalive_ self
    fun getListenBacklog self = (GioSocketClass.FFI.withPtr ---> GInt32.FFI.fromVal) getListenBacklog_ self
    fun getLocalAddress self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.FFI.fromPtr true) getLocalAddress_ (self & [])
    fun getProtocol self = (GioSocketClass.FFI.withPtr ---> GioSocketProtocol.FFI.fromVal) getProtocol_ self
    fun getRemoteAddress self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.FFI.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocketType self = (GioSocketClass.FFI.withPtr ---> GioSocketType.FFI.fromVal) getSocketType_ self
    fun getTimeout self = (GioSocketClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getTimeout_ self
    fun isClosed self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun isConnected self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) isConnected_ self
    fun listen self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) listen_ (self & [])
    fun receive
      self
      (
        buffer,
        size,
        cancellable
      ) =
      (
        GioSocketClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        receive_
        (
          self
           & buffer
           & size
           & cancellable
           & []
        )
    fun receiveFrom
      self
      (
        address,
        buffer,
        size,
        cancellable
      ) =
      (
        GioSocketClass.FFI.withPtr
         &&&> GioSocketAddressClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
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
    fun receiveWithBlocking
      self
      (
        buffer,
        size,
        blocking,
        cancellable
      ) =
      (
        GioSocketClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
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
    fun send self (buffer, cancellable) =
      let
        val size = LargeInt.fromInt (Utf8CVectorN.length buffer)
        val retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
          )
            send_
            (
              self
               & buffer
               & size
               & cancellable
               & []
            )
      in
        retVal
      end
    fun sendTo
      self
      (
        address,
        buffer,
        cancellable
      ) =
      let
        val size = LargeInt.fromInt (Utf8CVectorN.length buffer)
        val retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> GioSocketAddressClass.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
          )
            sendTo_
            (
              self
               & address
               & buffer
               & size
               & cancellable
               & []
            )
      in
        retVal
      end
    fun sendWithBlocking
      self
      (
        buffer,
        blocking,
        cancellable
      ) =
      let
        val size = LargeInt.fromInt (Utf8CVectorN.length buffer)
        val retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
          )
            sendWithBlocking_
            (
              self
               & buffer
               & size
               & blocking
               & cancellable
               & []
            )
      in
        retVal
      end
    fun setBlocking self blocking = (GioSocketClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setBlocking_ (self & blocking)
    fun setKeepalive self keepalive = (GioSocketClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKeepalive_ (self & keepalive)
    fun setListenBacklog self backlog = (GioSocketClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setListenBacklog_ (self & backlog)
    fun setTimeout self timeout = (GioSocketClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setTimeout_ (self & timeout)
    fun shutdown self (shutdownRead, shutdownWrite) =
      (
        GioSocketClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        shutdown_
        (
          self
           & shutdownRead
           & shutdownWrite
           & []
        )
    fun speaksIpv4 self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) speaksIpv4_ self
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
