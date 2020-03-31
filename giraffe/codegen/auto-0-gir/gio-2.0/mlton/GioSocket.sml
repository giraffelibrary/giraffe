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
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketClass.FFI.notnull GioSocketClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromFd_ = fn x1 & x2 => (_import "g_socket_new_from_fd" : GInt.FFI.val_ * (unit, unit) GLibErrorRecord.FFI.r -> GioSocketClass.FFI.notnull GioSocketClass.FFI.p;) (x1, x2)
    val accept_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_accept" :
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketClass.FFI.notnull GioSocketClass.FFI.p;
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p
               * GBool.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val checkConnectResult_ = fn x1 & x2 => (_import "g_socket_check_connect_result" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val close_ = fn x1 & x2 => (_import "g_socket_close" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val conditionCheck_ = fn x1 & x2 => (_import "g_socket_condition_check" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GLibIOCondition.FFI.val_ -> GLibIOCondition.FFI.val_;) (x1, x2)
    val conditionTimedWait_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_socket_condition_timed_wait" :
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GLibIOCondition.FFI.val_
               * GInt64.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GLibIOCondition.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val connectionFactoryCreateConnection_ = _import "g_socket_connection_factory_create_connection" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
    val getAvailableBytes_ = _import "g_socket_get_available_bytes" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GSSize.FFI.val_;
    val getBlocking_ = _import "g_socket_get_blocking" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getBroadcast_ = _import "g_socket_get_broadcast" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getCredentials_ = fn x1 & x2 => (_import "g_socket_get_credentials" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioCredentialsClass.FFI.notnull GioCredentialsClass.FFI.p;) (x1, x2)
    val getFamily_ = _import "g_socket_get_family" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GioSocketFamily.FFI.val_;
    val getFd_ = _import "g_socket_get_fd" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GInt.FFI.val_;
    val getKeepalive_ = _import "g_socket_get_keepalive" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getListenBacklog_ = _import "g_socket_get_listen_backlog" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GInt.FFI.val_;
    val getLocalAddress_ = fn x1 & x2 => (_import "g_socket_get_local_address" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;) (x1, x2)
    val getMulticastLoopback_ = _import "g_socket_get_multicast_loopback" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getMulticastTtl_ = _import "g_socket_get_multicast_ttl" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GUInt.FFI.val_;
    val getOption_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_socket_get_option" :
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getProtocol_ = _import "g_socket_get_protocol" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GioSocketProtocol.FFI.val_;
    val getRemoteAddress_ = fn x1 & x2 => (_import "g_socket_get_remote_address" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;) (x1, x2)
    val getSocketType_ = _import "g_socket_get_socket_type" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GioSocketType.FFI.val_;
    val getTimeout_ = _import "g_socket_get_timeout" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GUInt.FFI.val_;
    val getTtl_ = _import "g_socket_get_ttl" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GUInt.FFI.val_;
    val isClosed_ = _import "g_socket_is_closed" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val isConnected_ = _import "g_socket_is_connected" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val joinMulticastGroup_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_socket_join_multicast_group" :
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GioInetAddressClass.FFI.notnull GioInetAddressClass.FFI.p
               * GBool.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GioInetAddressClass.FFI.notnull GioInetAddressClass.FFI.p
               * GBool.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
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
    val listen_ = fn x1 & x2 => (_import "g_socket_listen" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val receive_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_socket_receive" :
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * (unit, GioSocketAddressClass.FFI.notnull) GioSocketAddressClass.FFI.r
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * GBool.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * unit GioSocketAddressClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * GBool.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
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
    val setBlocking_ = fn x1 & x2 => (_import "g_socket_set_blocking" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBroadcast_ = fn x1 & x2 => (_import "g_socket_set_broadcast" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setKeepalive_ = fn x1 & x2 => (_import "g_socket_set_keepalive" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setListenBacklog_ = fn x1 & x2 => (_import "g_socket_set_listen_backlog" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMulticastLoopback_ = fn x1 & x2 => (_import "g_socket_set_multicast_loopback" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMulticastTtl_ = fn x1 & x2 => (_import "g_socket_set_multicast_ttl" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setOption_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_socket_set_option" :
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_set_timeout" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setTtl_ = fn x1 & x2 => (_import "g_socket_set_ttl" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val shutdown_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_shutdown" :
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val speaksIpv4_ = _import "g_socket_speaks_ipv4" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
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
    fun asDatagramBased self = (GObjectObjectClass.FFI.withPtr ---> GioDatagramBasedClass.FFI.fromPtr false) I self
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
    fun newFromFd fd = (GInt.FFI.withVal &&&> GLibErrorRecord.handleError ---> GioSocketClass.FFI.fromPtr true) newFromFd_ (fd & [])
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
    fun conditionTimedWait
      self
      (
        condition,
        timeout,
        cancellable
      ) =
      (
        GioSocketClass.FFI.withPtr
         &&&> GLibIOCondition.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
    fun getAvailableBytes self = (GioSocketClass.FFI.withPtr ---> GSSize.FFI.fromVal) getAvailableBytes_ self
    fun getBlocking self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) getBlocking_ self
    fun getBroadcast self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) getBroadcast_ self
    fun getCredentials self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioCredentialsClass.FFI.fromPtr true) getCredentials_ (self & [])
    fun getFamily self = (GioSocketClass.FFI.withPtr ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getFd self = (GioSocketClass.FFI.withPtr ---> GInt.FFI.fromVal) getFd_ self
    fun getKeepalive self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) getKeepalive_ self
    fun getListenBacklog self = (GioSocketClass.FFI.withPtr ---> GInt.FFI.fromVal) getListenBacklog_ self
    fun getLocalAddress self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.FFI.fromPtr true) getLocalAddress_ (self & [])
    fun getMulticastLoopback self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) getMulticastLoopback_ self
    fun getMulticastTtl self = (GioSocketClass.FFI.withPtr ---> GUInt.FFI.fromVal) getMulticastTtl_ self
    fun getOption self (level, optname) =
      let
        val value & () =
          (
            GioSocketClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GInt.FFI.fromVal && ignore
          )
            getOption_
            (
              self
               & level
               & optname
               & GInt.null
               & []
            )
      in
        value
      end
    fun getProtocol self = (GioSocketClass.FFI.withPtr ---> GioSocketProtocol.FFI.fromVal) getProtocol_ self
    fun getRemoteAddress self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.FFI.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocketType self = (GioSocketClass.FFI.withPtr ---> GioSocketType.FFI.fromVal) getSocketType_ self
    fun getTimeout self = (GioSocketClass.FFI.withPtr ---> GUInt.FFI.fromVal) getTimeout_ self
    fun getTtl self = (GioSocketClass.FFI.withPtr ---> GUInt.FFI.fromVal) getTtl_ self
    fun isClosed self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun isConnected self = (GioSocketClass.FFI.withPtr ---> GBool.FFI.fromVal) isConnected_ self
    fun joinMulticastGroup
      self
      (
        group,
        sourceSpecific,
        iface
      ) =
      (
        GioSocketClass.FFI.withPtr
         &&&> GioInetAddressClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
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
        GioSocketClass.FFI.withPtr
         &&&> GioInetAddressClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
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
    fun listen self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) listen_ (self & [])
    fun receive self (buffer, cancellable) =
      let
        val size = GUInt8CArrayN.length buffer
        val retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
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
        val size = GUInt8CArrayN.length buffer
        val address & retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> GioSocketAddressClass.FFI.withRefOptPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GioSocketAddressClass.FFI.fromPtr true && GSSize.FFI.fromVal
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
        val size = GUInt8CArrayN.length buffer
        val retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
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
        val size = GUInt8CArrayN.length buffer
        val retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
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
        val size = GUInt8CArrayN.length buffer
        val retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> GioSocketAddressClass.FFI.withOptPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
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
        val size = GUInt8CArrayN.length buffer
        val retVal =
          (
            GioSocketClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
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
    fun setBroadcast self broadcast = (GioSocketClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setBroadcast_ (self & broadcast)
    fun setKeepalive self keepalive = (GioSocketClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKeepalive_ (self & keepalive)
    fun setListenBacklog self backlog = (GioSocketClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setListenBacklog_ (self & backlog)
    fun setMulticastLoopback self loopback = (GioSocketClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setMulticastLoopback_ (self & loopback)
    fun setMulticastTtl self ttl = (GioSocketClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setMulticastTtl_ (self & ttl)
    fun setOption
      self
      (
        level,
        optname,
        value
      ) =
      (
        GioSocketClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun setTimeout self timeout = (GioSocketClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setTimeout_ (self & timeout)
    fun setTtl self ttl = (GioSocketClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setTtl_ (self & ttl)
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
