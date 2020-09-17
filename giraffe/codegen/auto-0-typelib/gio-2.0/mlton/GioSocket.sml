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
    val getType_ = _import "g_socket_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_new" :
              GioSocketFamily.FFI.val_
               * GioSocketType.FFI.val_
               * GioSocketProtocol.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketClass.FFI.non_opt GioSocketClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromFd_ = fn x1 & x2 => (_import "g_socket_new_from_fd" : GInt32.FFI.val_ * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioSocketClass.FFI.non_opt GioSocketClass.FFI.p;) (x1, x2)
    val accept_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_accept" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketClass.FFI.non_opt GioSocketClass.FFI.p;
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
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val checkConnectResult_ = fn x1 & x2 => (_import "g_socket_check_connect_result" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val close_ = fn x1 & x2 => (_import "g_socket_close" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val conditionCheck_ = fn x1 & x2 => (_import "g_socket_condition_check" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GLibIOCondition.FFI.val_ -> GLibIOCondition.FFI.val_;) (x1, x2)
    val conditionTimedWait_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_socket_condition_timed_wait" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GLibIOCondition.FFI.val_
               * GInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val conditionWait_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_condition_wait" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GLibIOCondition.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val connectionFactoryCreateConnection_ = _import "g_socket_connection_factory_create_connection" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
    val getAvailableBytes_ = _import "g_socket_get_available_bytes" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GInt64.FFI.val_;
    val getBlocking_ = _import "g_socket_get_blocking" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getBroadcast_ = _import "g_socket_get_broadcast" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getCredentials_ = fn x1 & x2 => (_import "g_socket_get_credentials" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p;) (x1, x2)
    val getFamily_ = _import "g_socket_get_family" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GioSocketFamily.FFI.val_;
    val getFd_ = _import "g_socket_get_fd" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GInt32.FFI.val_;
    val getKeepalive_ = _import "g_socket_get_keepalive" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getListenBacklog_ = _import "g_socket_get_listen_backlog" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GInt32.FFI.val_;
    val getLocalAddress_ = fn x1 & x2 => (_import "g_socket_get_local_address" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;) (x1, x2)
    val getMulticastLoopback_ = _import "g_socket_get_multicast_loopback" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getMulticastTtl_ = _import "g_socket_get_multicast_ttl" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GUInt32.FFI.val_;
    val getOption_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_socket_get_option" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getProtocol_ = _import "g_socket_get_protocol" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GioSocketProtocol.FFI.val_;
    val getRemoteAddress_ = fn x1 & x2 => (_import "g_socket_get_remote_address" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;) (x1, x2)
    val getSocketType_ = _import "g_socket_get_socket_type" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GioSocketType.FFI.val_;
    val getTimeout_ = _import "g_socket_get_timeout" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GUInt32.FFI.val_;
    val getTtl_ = _import "g_socket_get_ttl" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GUInt32.FFI.val_;
    val isClosed_ = _import "g_socket_is_closed" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GBool.FFI.val_;
    val isConnected_ = _import "g_socket_is_connected" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GBool.FFI.val_;
    val joinMulticastGroup_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_socket_join_multicast_group" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p
               * GBool.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val leaveMulticastGroup_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_socket_leave_multicast_group" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p
               * GBool.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val listen_ = fn x1 & x2 => (_import "g_socket_listen" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val receive_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_socket_receive" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GUInt8CArrayN.MLton.r1
               * (GUInt8CArrayN.FFI.opt, GUInt8CArrayN.FFI.non_opt) GUInt8CArrayN.MLton.r2
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
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
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * (GioSocketAddressClass.FFI.opt, GioSocketAddressClass.FFI.non_opt) GioSocketAddressClass.FFI.r
               * GUInt8CArrayN.MLton.r1
               * (GUInt8CArrayN.FFI.opt, GUInt8CArrayN.FFI.non_opt) GUInt8CArrayN.MLton.r2
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
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
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GUInt8CArrayN.MLton.r1
               * (GUInt8CArrayN.FFI.opt, GUInt8CArrayN.FFI.non_opt) GUInt8CArrayN.MLton.r2
               * GUInt64.FFI.val_
               * GBool.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
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
    val send_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_socket_send" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val sendTo_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_socket_send_to" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GioSocketAddressClass.FFI.opt GioSocketAddressClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
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
    val sendWithBlocking_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_socket_send_with_blocking" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GBool.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
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
    val setBlocking_ = fn x1 & x2 => (_import "g_socket_set_blocking" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBroadcast_ = fn x1 & x2 => (_import "g_socket_set_broadcast" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setKeepalive_ = fn x1 & x2 => (_import "g_socket_set_keepalive" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setListenBacklog_ = fn x1 & x2 => (_import "g_socket_set_listen_backlog" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setMulticastLoopback_ = fn x1 & x2 => (_import "g_socket_set_multicast_loopback" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMulticastTtl_ = fn x1 & x2 => (_import "g_socket_set_multicast_ttl" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setOption_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_socket_set_option" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_set_timeout" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setTtl_ = fn x1 & x2 => (_import "g_socket_set_ttl" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val shutdown_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_shutdown" :
              GioSocketClass.FFI.non_opt GioSocketClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val speaksIpv4_ = _import "g_socket_speaks_ipv4" : GioSocketClass.FFI.non_opt GioSocketClass.FFI.p -> GBool.FFI.val_;
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
    fun receive self (size, cancellable) =
      let
        val buffer & retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr 0 && GInt64.FFI.fromVal
          )
            receive_
            (
              self
               & NONE
               & size
               & cancellable
               & []
            )
      in
        (retVal, buffer (LargeInt.toInt size)) before GioSocketClass.FFI.touchPtr self before GioCancellableClass.FFI.touchOptPtr cancellable
      end
    fun receiveFrom self (size, cancellable) =
      let
        val address
         & buffer
         & retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GioSocketAddressClass.FFI.withRefOptPtr true
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GioSocketAddressClass.FFI.fromPtr true
                   && GUInt8CArrayN.FFI.fromPtr 0
                   && GInt64.FFI.fromVal
          )
            receiveFrom_
            (
              self
               & NONE
               & NONE
               & size
               & cancellable
               & []
            )
      in
        (
          retVal,
          address,
          buffer (LargeInt.toInt size)
        )
         before GioSocketClass.FFI.touchPtr self
         before GioCancellableClass.FFI.touchOptPtr cancellable
      end
    fun receiveWithBlocking
      self
      (
        size,
        blocking,
        cancellable
      ) =
      let
        val buffer & retVal =
          (
            GioSocketClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr 0 && GInt64.FFI.fromVal
          )
            receiveWithBlocking_
            (
              self
               & NONE
               & size
               & blocking
               & cancellable
               & []
            )
      in
        (retVal, buffer (LargeInt.toInt size)) before GioSocketClass.FFI.touchPtr self before GioCancellableClass.FFI.touchOptPtr cancellable
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
      open ValueAccessor
    in
      val blockingProp =
        {
          name = "blocking",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val broadcastProp =
        {
          name = "broadcast",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val familyProp =
        {
          name = "family",
          gtype = fn () => C.gtype GioSocketFamily.t (),
          get = fn x => fn () => C.get GioSocketFamily.t x,
          set = ignore,
          init = fn x => C.set GioSocketFamily.t x
        }
      val fdProp =
        {
          name = "fd",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = fn x => C.set int x
        }
      val keepaliveProp =
        {
          name = "keepalive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val listenBacklogProp =
        {
          name = "listen-backlog",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val localAddressProp =
        {
          name = "local-address",
          gtype = fn () => C.gtype GioSocketAddressClass.tOpt (),
          get = fn x => fn () => C.get GioSocketAddressClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val multicastLoopbackProp =
        {
          name = "multicast-loopback",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val multicastTtlProp =
        {
          name = "multicast-ttl",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val protocolProp =
        {
          name = "protocol",
          gtype = fn () => C.gtype GioSocketProtocol.t (),
          get = fn x => fn () => C.get GioSocketProtocol.t x,
          set = ignore,
          init = fn x => C.set GioSocketProtocol.t x
        }
      val remoteAddressProp =
        {
          name = "remote-address",
          gtype = fn () => C.gtype GioSocketAddressClass.tOpt (),
          get = fn x => fn () => C.get GioSocketAddressClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val timeoutProp =
        {
          name = "timeout",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val ttlProp =
        {
          name = "ttl",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val typeProp =
        {
          name = "type",
          gtype = fn () => C.gtype GioSocketType.t (),
          get = fn x => fn () => C.get GioSocketType.t x,
          set = ignore,
          init = fn x => C.set GioSocketType.t x
        }
    end
  end
