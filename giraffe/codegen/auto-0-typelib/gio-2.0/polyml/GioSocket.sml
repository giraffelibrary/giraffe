structure GioSocket :>
  GIO_SOCKET
    where type 'a class = 'a GioSocketClass.class
    where type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type socket_family_t = GioSocketFamily.t
    where type socket_protocol_t = GioSocketProtocol.t
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type socket_type_t = GioSocketType.t =
  struct
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
      val conditionTimedWait_ =
        call (getSymbol "g_socket_condition_timed_wait")
          (
            GioSocketClass.PolyML.cPtr
             &&> GLibIOCondition.PolyML.cVal
             &&> GInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
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
      val getAvailableBytes_ = call (getSymbol "g_socket_get_available_bytes") (GioSocketClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getBlocking_ = call (getSymbol "g_socket_get_blocking") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBroadcast_ = call (getSymbol "g_socket_get_broadcast") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCredentials_ = call (getSymbol "g_socket_get_credentials") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioCredentialsClass.PolyML.cPtr)
      val getFamily_ = call (getSymbol "g_socket_get_family") (GioSocketClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getFd_ = call (getSymbol "g_socket_get_fd") (GioSocketClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getKeepalive_ = call (getSymbol "g_socket_get_keepalive") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getListenBacklog_ = call (getSymbol "g_socket_get_listen_backlog") (GioSocketClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getLocalAddress_ = call (getSymbol "g_socket_get_local_address") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getMulticastLoopback_ = call (getSymbol "g_socket_get_multicast_loopback") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMulticastTtl_ = call (getSymbol "g_socket_get_multicast_ttl") (GioSocketClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getOption_ =
        call (getSymbol "g_socket_get_option")
          (
            GioSocketClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getProtocol_ = call (getSymbol "g_socket_get_protocol") (GioSocketClass.PolyML.cPtr --> GioSocketProtocol.PolyML.cVal)
      val getRemoteAddress_ = call (getSymbol "g_socket_get_remote_address") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getSocketType_ = call (getSymbol "g_socket_get_socket_type") (GioSocketClass.PolyML.cPtr --> GioSocketType.PolyML.cVal)
      val getTimeout_ = call (getSymbol "g_socket_get_timeout") (GioSocketClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getTtl_ = call (getSymbol "g_socket_get_ttl") (GioSocketClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val isClosed_ = call (getSymbol "g_socket_is_closed") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isConnected_ = call (getSymbol "g_socket_is_connected") (GioSocketClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val joinMulticastGroup_ =
        call (getSymbol "g_socket_join_multicast_group")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioInetAddressClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val leaveMulticastGroup_ =
        call (getSymbol "g_socket_leave_multicast_group")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioInetAddressClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val listen_ = call (getSymbol "g_socket_listen") (GioSocketClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val receive_ =
        call (getSymbol "g_socket_receive")
          (
            GioSocketClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val receiveFrom_ =
        call (getSymbol "g_socket_receive_from")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cOutRef
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val receiveWithBlocking_ =
        call (getSymbol "g_socket_receive_with_blocking")
          (
            GioSocketClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
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
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val sendTo_ =
        call (getSymbol "g_socket_send_to")
          (
            GioSocketClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cOptPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val sendWithBlocking_ =
        call (getSymbol "g_socket_send_with_blocking")
          (
            GioSocketClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val setBlocking_ = call (getSymbol "g_socket_set_blocking") (GioSocketClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBroadcast_ = call (getSymbol "g_socket_set_broadcast") (GioSocketClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setKeepalive_ = call (getSymbol "g_socket_set_keepalive") (GioSocketClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setListenBacklog_ = call (getSymbol "g_socket_set_listen_backlog") (GioSocketClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setMulticastLoopback_ = call (getSymbol "g_socket_set_multicast_loopback") (GioSocketClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMulticastTtl_ = call (getSymbol "g_socket_set_multicast_ttl") (GioSocketClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setOption_ =
        call (getSymbol "g_socket_set_option")
          (
            GioSocketClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setTimeout_ = call (getSymbol "g_socket_set_timeout") (GioSocketClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setTtl_ = call (getSymbol "g_socket_set_ttl") (GioSocketClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
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
    type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type socket_family_t = GioSocketFamily.t
    type socket_protocol_t = GioSocketProtocol.t
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type socket_type_t = GioSocketType.t
    type t = base class
    fun asDatagramBased self = (GObjectObjectClass.FFI.withPtr false ---> GioDatagramBasedClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
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
        GioSocketClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioSocketClass.FFI.withPtr false
         &&&> GioSocketAddressClass.FFI.withPtr false
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
    fun checkConnectResult self = (GioSocketClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) checkConnectResult_ (self & [])
    fun close self = (GioSocketClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) close_ (self & [])
    fun conditionCheck self condition = (GioSocketClass.FFI.withPtr false &&&> GLibIOCondition.FFI.withVal ---> GLibIOCondition.FFI.fromVal) conditionCheck_ (self & condition)
    fun conditionTimedWait
      self
      (
        condition,
        timeout,
        cancellable
      ) =
      (
        GioSocketClass.FFI.withPtr false
         &&&> GLibIOCondition.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        conditionTimedWait_
        (
          self
           & condition
           & timeout
           & cancellable
           & []
        )
    fun conditionWait self (condition, cancellable) =
      (
        GioSocketClass.FFI.withPtr false
         &&&> GLibIOCondition.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioSocketClass.FFI.withPtr false
         &&&> GioSocketAddressClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
    fun connectionFactoryCreateConnection self = (GioSocketClass.FFI.withPtr false ---> GioSocketConnectionClass.FFI.fromPtr true) connectionFactoryCreateConnection_ self
    fun getAvailableBytes self = (GioSocketClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getAvailableBytes_ self
    fun getBlocking self = (GioSocketClass.FFI.withPtr false ---> GBool.FFI.fromVal) getBlocking_ self
    fun getBroadcast self = (GioSocketClass.FFI.withPtr false ---> GBool.FFI.fromVal) getBroadcast_ self
    fun getCredentials self = (GioSocketClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioCredentialsClass.FFI.fromPtr true) getCredentials_ (self & [])
    fun getFamily self = (GioSocketClass.FFI.withPtr false ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getFd self = (GioSocketClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getFd_ self
    fun getKeepalive self = (GioSocketClass.FFI.withPtr false ---> GBool.FFI.fromVal) getKeepalive_ self
    fun getListenBacklog self = (GioSocketClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getListenBacklog_ self
    fun getLocalAddress self = (GioSocketClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.FFI.fromPtr true) getLocalAddress_ (self & [])
    fun getMulticastLoopback self = (GioSocketClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMulticastLoopback_ self
    fun getMulticastTtl self = (GioSocketClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getMulticastTtl_ self
    fun getOption self (level, optname) =
      let
        val value & () =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GInt32.FFI.fromVal && ignore
          )
            getOption_
            (
              self
               & level
               & optname
               & GInt32.null
               & []
            )
      in
        value
      end
    fun getProtocol self = (GioSocketClass.FFI.withPtr false ---> GioSocketProtocol.FFI.fromVal) getProtocol_ self
    fun getRemoteAddress self = (GioSocketClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.FFI.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocketType self = (GioSocketClass.FFI.withPtr false ---> GioSocketType.FFI.fromVal) getSocketType_ self
    fun getTimeout self = (GioSocketClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getTimeout_ self
    fun getTtl self = (GioSocketClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getTtl_ self
    fun isClosed self = (GioSocketClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun isConnected self = (GioSocketClass.FFI.withPtr false ---> GBool.FFI.fromVal) isConnected_ self
    fun joinMulticastGroup
      self
      (
        group,
        sourceSpecific,
        iface
      ) =
      (
        GioSocketClass.FFI.withPtr false
         &&&> GioInetAddressClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        joinMulticastGroup_
        (
          self
           & group
           & sourceSpecific
           & iface
           & []
        )
    fun leaveMulticastGroup
      self
      (
        group,
        sourceSpecific,
        iface
      ) =
      (
        GioSocketClass.FFI.withPtr false
         &&&> GioInetAddressClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        leaveMulticastGroup_
        (
          self
           & group
           & sourceSpecific
           & iface
           & []
        )
    fun listen self = (GioSocketClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) listen_ (self & [])
    fun receive self (buffer, cancellable) =
      let
        val size = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
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
      in
        retVal
      end
    fun receiveFrom self (buffer, cancellable) =
      let
        val size = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val address & retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GioSocketAddressClass.FFI.withRefOptPtr true
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GioSocketAddressClass.FFI.fromPtr true && GInt64.FFI.fromVal
          )
            receiveFrom_
            (
              self
               & NONE
               & buffer
               & size
               & cancellable
               & []
            )
      in
        (retVal, address)
      end
    fun receiveWithBlocking
      self
      (
        buffer,
        blocking,
        cancellable
      ) =
      let
        val size = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
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
      in
        retVal
      end
    fun send self (buffer, cancellable) =
      let
        val size = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
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
        val size = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GioSocketAddressClass.FFI.withOptPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
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
        val size = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
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
    fun setBlocking self blocking = (GioSocketClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setBlocking_ (self & blocking)
    fun setBroadcast self broadcast = (GioSocketClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setBroadcast_ (self & broadcast)
    fun setKeepalive self keepalive = (GioSocketClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setKeepalive_ (self & keepalive)
    fun setListenBacklog self backlog = (GioSocketClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setListenBacklog_ (self & backlog)
    fun setMulticastLoopback self loopback = (GioSocketClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setMulticastLoopback_ (self & loopback)
    fun setMulticastTtl self ttl = (GioSocketClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setMulticastTtl_ (self & ttl)
    fun setOption
      self
      (
        level,
        optname,
        value
      ) =
      (
        GioSocketClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setOption_
        (
          self
           & level
           & optname
           & value
           & []
        )
    fun setTimeout self timeout = (GioSocketClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setTimeout_ (self & timeout)
    fun setTtl self ttl = (GioSocketClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setTtl_ (self & ttl)
    fun shutdown self (shutdownRead, shutdownWrite) =
      (
        GioSocketClass.FFI.withPtr false
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
    fun speaksIpv4 self = (GioSocketClass.FFI.withPtr false ---> GBool.FFI.fromVal) speaksIpv4_ self
    local
      open Property
    in
      val blockingProp =
        {
          get = fn x => get "blocking" boolean x,
          set = fn x => set "blocking" boolean x,
          new = fn x => new "blocking" boolean x
        }
      val broadcastProp =
        {
          get = fn x => get "broadcast" boolean x,
          set = fn x => set "broadcast" boolean x,
          new = fn x => new "broadcast" boolean x
        }
      val familyProp =
        {
          get = fn x => get "family" GioSocketFamily.t x,
          new = fn x => new "family" GioSocketFamily.t x
        }
      val fdProp =
        {
          get = fn x => get "fd" int x,
          new = fn x => new "fd" int x
        }
      val keepaliveProp =
        {
          get = fn x => get "keepalive" boolean x,
          set = fn x => set "keepalive" boolean x,
          new = fn x => new "keepalive" boolean x
        }
      val listenBacklogProp =
        {
          get = fn x => get "listen-backlog" int x,
          set = fn x => set "listen-backlog" int x,
          new = fn x => new "listen-backlog" int x
        }
      val localAddressProp = {get = fn x => get "local-address" GioSocketAddressClass.tOpt x}
      val multicastLoopbackProp =
        {
          get = fn x => get "multicast-loopback" boolean x,
          set = fn x => set "multicast-loopback" boolean x,
          new = fn x => new "multicast-loopback" boolean x
        }
      val multicastTtlProp =
        {
          get = fn x => get "multicast-ttl" uint x,
          set = fn x => set "multicast-ttl" uint x,
          new = fn x => new "multicast-ttl" uint x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" GioSocketProtocol.t x,
          new = fn x => new "protocol" GioSocketProtocol.t x
        }
      val remoteAddressProp = {get = fn x => get "remote-address" GioSocketAddressClass.tOpt x}
      val timeoutProp =
        {
          get = fn x => get "timeout" uint x,
          set = fn x => set "timeout" uint x,
          new = fn x => new "timeout" uint x
        }
      val ttlProp =
        {
          get = fn x => get "ttl" uint x,
          set = fn x => set "ttl" uint x,
          new = fn x => new "ttl" uint x
        }
      val typeProp =
        {
          get = fn x => get "type" GioSocketType.t x,
          new = fn x => new "type" GioSocketType.t x
        }
    end
  end
