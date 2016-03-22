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
    val getType_ = _import "g_socket_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_new" :
              GioSocketFamily.C.val_
               * GioSocketType.C.val_
               * GioSocketProtocol.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketClass.C.notnull GioSocketClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromFd_ = fn x1 & x2 => (_import "g_socket_new_from_fd" : FFI.Int32.C.val_ * (unit, unit) GLibErrorRecord.C.r -> GioSocketClass.C.notnull GioSocketClass.C.p;) (x1, x2)
    val accept_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_accept" :
              GioSocketClass.C.notnull GioSocketClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketClass.C.notnull GioSocketClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val bind_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_bind" :
              GioSocketClass.C.notnull GioSocketClass.C.p
               * GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p
               * FFI.Bool.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val checkConnectResult_ = fn x1 & x2 => (_import "g_socket_check_connect_result" : GioSocketClass.C.notnull GioSocketClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val close_ = fn x1 & x2 => (_import "g_socket_close" : GioSocketClass.C.notnull GioSocketClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val conditionCheck_ = fn x1 & x2 => (_import "g_socket_condition_check" : GioSocketClass.C.notnull GioSocketClass.C.p * GLibIOCondition.C.val_ -> GLibIOCondition.C.val_;) (x1, x2)
    val conditionWait_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_condition_wait" :
              GioSocketClass.C.notnull GioSocketClass.C.p
               * GLibIOCondition.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val connect_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_connect" :
              GioSocketClass.C.notnull GioSocketClass.C.p
               * GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val connectionFactoryCreateConnection_ = _import "g_socket_connection_factory_create_connection" : GioSocketClass.C.notnull GioSocketClass.C.p -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
    val getBlocking_ = _import "g_socket_get_blocking" : GioSocketClass.C.notnull GioSocketClass.C.p -> FFI.Bool.C.val_;
    val getCredentials_ = fn x1 & x2 => (_import "g_socket_get_credentials" : GioSocketClass.C.notnull GioSocketClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioCredentialsClass.C.notnull GioCredentialsClass.C.p;) (x1, x2)
    val getFamily_ = _import "g_socket_get_family" : GioSocketClass.C.notnull GioSocketClass.C.p -> GioSocketFamily.C.val_;
    val getFd_ = _import "g_socket_get_fd" : GioSocketClass.C.notnull GioSocketClass.C.p -> FFI.Int32.C.val_;
    val getKeepalive_ = _import "g_socket_get_keepalive" : GioSocketClass.C.notnull GioSocketClass.C.p -> FFI.Bool.C.val_;
    val getListenBacklog_ = _import "g_socket_get_listen_backlog" : GioSocketClass.C.notnull GioSocketClass.C.p -> FFI.Int32.C.val_;
    val getLocalAddress_ = fn x1 & x2 => (_import "g_socket_get_local_address" : GioSocketClass.C.notnull GioSocketClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p;) (x1, x2)
    val getProtocol_ = _import "g_socket_get_protocol" : GioSocketClass.C.notnull GioSocketClass.C.p -> GioSocketProtocol.C.val_;
    val getRemoteAddress_ = fn x1 & x2 => (_import "g_socket_get_remote_address" : GioSocketClass.C.notnull GioSocketClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p;) (x1, x2)
    val getSocketType_ = _import "g_socket_get_socket_type" : GioSocketClass.C.notnull GioSocketClass.C.p -> GioSocketType.C.val_;
    val getTimeout_ = _import "g_socket_get_timeout" : GioSocketClass.C.notnull GioSocketClass.C.p -> FFI.UInt32.C.val_;
    val isClosed_ = _import "g_socket_is_closed" : GioSocketClass.C.notnull GioSocketClass.C.p -> FFI.Bool.C.val_;
    val isConnected_ = _import "g_socket_is_connected" : GioSocketClass.C.notnull GioSocketClass.C.p -> FFI.Bool.C.val_;
    val listen_ = fn x1 & x2 => (_import "g_socket_listen" : GioSocketClass.C.notnull GioSocketClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val receive_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_socket_receive" :
              GioSocketClass.C.notnull GioSocketClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt64.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val receiveFrom_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_socket_receive_from" :
              GioSocketClass.C.notnull GioSocketClass.C.p
               * GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt64.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val receiveWithBlocking_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_socket_receive_with_blocking" :
              GioSocketClass.C.notnull GioSocketClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt64.C.val_
               * FFI.Bool.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setBlocking_ = fn x1 & x2 => (_import "g_socket_set_blocking" : GioSocketClass.C.notnull GioSocketClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setKeepalive_ = fn x1 & x2 => (_import "g_socket_set_keepalive" : GioSocketClass.C.notnull GioSocketClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setListenBacklog_ = fn x1 & x2 => (_import "g_socket_set_listen_backlog" : GioSocketClass.C.notnull GioSocketClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_set_timeout" : GioSocketClass.C.notnull GioSocketClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val shutdown_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_shutdown" :
              GioSocketClass.C.notnull GioSocketClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val speaksIpv4_ = _import "g_socket_speaks_ipv4" : GioSocketClass.C.notnull GioSocketClass.C.p -> FFI.Bool.C.val_;
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
