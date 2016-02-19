structure GioSocket :>
  GIO_SOCKET
    where type 'a class_t = 'a GioSocketClass.t
    where type 'a initable_class_t = 'a GioInitableClass.t
    where type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    where type 'a credentials_class_t = 'a GioCredentialsClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type socket_family_t = GioSocketFamily.t
    where type socket_protocol_t = GioSocketProtocol.t
    where type 'a socket_address_class_t = 'a GioSocketAddressClass.t
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
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromFd_ = fn x1 & x2 => (_import "g_socket_new_from_fd" : FFI.Int32.C.val_ * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val accept_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_accept" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
    val checkConnectResult_ = fn x1 & x2 => (_import "g_socket_check_connect_result" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val close_ = fn x1 & x2 => (_import "g_socket_close" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val conditionCheck_ = fn x1 & x2 => (_import "g_socket_condition_check" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GLibIOCondition.C.val_ -> GLibIOCondition.C.val_;) (x1, x2)
    val conditionWait_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_condition_wait" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GLibIOCondition.C.val_
               * unit GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val connectionFactoryCreateConnection_ = _import "g_socket_connection_factory_create_connection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBlocking_ = _import "g_socket_get_blocking" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getCredentials_ = fn x1 & x2 => (_import "g_socket_get_credentials" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getFamily_ = _import "g_socket_get_family" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketFamily.C.val_;
    val getFd_ = _import "g_socket_get_fd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getKeepalive_ = _import "g_socket_get_keepalive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getListenBacklog_ = _import "g_socket_get_listen_backlog" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getLocalAddress_ = fn x1 & x2 => (_import "g_socket_get_local_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getProtocol_ = _import "g_socket_get_protocol" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketProtocol.C.val_;
    val getRemoteAddress_ = fn x1 & x2 => (_import "g_socket_get_remote_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getSocketType_ = _import "g_socket_get_socket_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketType.C.val_;
    val getTimeout_ = _import "g_socket_get_timeout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val isClosed_ = _import "g_socket_is_closed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isConnected_ = _import "g_socket_is_connected" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val listen_ = fn x1 & x2 => (_import "g_socket_listen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val receive_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_socket_receive" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt64.C.val_
               * unit GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt64.C.val_
               * unit GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt64.C.val_
               * FFI.Bool.C.val_
               * unit GObjectObjectClass.C.p
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
    val setBlocking_ = fn x1 & x2 => (_import "g_socket_set_blocking" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setKeepalive_ = fn x1 & x2 => (_import "g_socket_set_keepalive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setListenBacklog_ = fn x1 & x2 => (_import "g_socket_set_listen_backlog" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_set_timeout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val shutdown_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_shutdown" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
    val speaksIpv4_ = _import "g_socket_speaks_ipv4" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a GioSocketClass.t
    type 'a initable_class_t = 'a GioInitableClass.t
    type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    type 'a credentials_class_t = 'a GioCredentialsClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type socket_family_t = GioSocketFamily.t
    type socket_protocol_t = GioSocketProtocol.t
    type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    type socket_type_t = GioSocketType.t
    type t = base class_t
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new family type' protocol =
      (
        GioSocketFamily.C.withVal
         &&&> GioSocketType.C.withVal
         &&&> GioSocketProtocol.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GioSocketClass.C.fromPtr true
      )
        new_
        (
          family
           & type'
           & protocol
           & []
        )
    fun newFromFd fd = (FFI.Int32.C.withVal &&&> GLibErrorRecord.C.handleError ---> GioSocketClass.C.fromPtr true) newFromFd_ (fd & [])
    fun accept self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        bind_
        (
          self
           & address
           & allowReuse
           & []
        )
    fun checkConnectResult self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) checkConnectResult_ (self & [])
    fun close self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) close_ (self & [])
    fun conditionCheck self condition = (GObjectObjectClass.C.withPtr &&&> GLibIOCondition.C.withVal ---> GLibIOCondition.C.fromVal) conditionCheck_ (self & condition)
    fun conditionWait self condition cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GLibIOCondition.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
    fun getCredentials self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioCredentialsClass.C.fromPtr true) getCredentials_ (self & [])
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun getKeepalive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getKeepalive_ self
    fun getListenBacklog self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getListenBacklog_ self
    fun getLocalAddress self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioSocketAddressClass.C.fromPtr true) getLocalAddress_ (self & [])
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> GioSocketProtocol.C.fromVal) getProtocol_ self
    fun getRemoteAddress self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioSocketAddressClass.C.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocketType self = (GObjectObjectClass.C.withPtr ---> GioSocketType.C.fromVal) getSocketType_ self
    fun getTimeout self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getTimeout_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun isConnected self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isConnected_ self
    fun listen self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) listen_ (self & [])
    fun receive self buffer size cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
