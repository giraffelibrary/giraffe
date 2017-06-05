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
    val newFromFd_ = fn x1 & x2 => (_import "g_socket_new_from_fd" : GInt32.FFI.val_ * (unit, unit) GLibErrorRecord.FFI.r -> GioSocketClass.FFI.notnull GioSocketClass.FFI.p;) (x1, x2)
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
    val getBlocking_ = _import "g_socket_get_blocking" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getCredentials_ = fn x1 & x2 => (_import "g_socket_get_credentials" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioCredentialsClass.FFI.notnull GioCredentialsClass.FFI.p;) (x1, x2)
    val getFamily_ = _import "g_socket_get_family" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GioSocketFamily.FFI.val_;
    val getFd_ = _import "g_socket_get_fd" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GInt32.FFI.val_;
    val getKeepalive_ = _import "g_socket_get_keepalive" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val getListenBacklog_ = _import "g_socket_get_listen_backlog" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GInt32.FFI.val_;
    val getLocalAddress_ = fn x1 & x2 => (_import "g_socket_get_local_address" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;) (x1, x2)
    val getProtocol_ = _import "g_socket_get_protocol" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GioSocketProtocol.FFI.val_;
    val getRemoteAddress_ = fn x1 & x2 => (_import "g_socket_get_remote_address" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;) (x1, x2)
    val getSocketType_ = _import "g_socket_get_socket_type" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GioSocketType.FFI.val_;
    val getTimeout_ = _import "g_socket_get_timeout" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GUInt32.FFI.val_;
    val isClosed_ = _import "g_socket_is_closed" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
    val isConnected_ = _import "g_socket_is_connected" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GBool.FFI.val_;
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
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt64.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt64.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt64.FFI.val_
               * GBool.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GUInt64.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GUInt64.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
              GioSocketClass.FFI.notnull GioSocketClass.FFI.p
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GUInt64.FFI.val_
               * GBool.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
    val setBlocking_ = fn x1 & x2 => (_import "g_socket_set_blocking" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setKeepalive_ = fn x1 & x2 => (_import "g_socket_set_keepalive" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setListenBacklog_ = fn x1 & x2 => (_import "g_socket_set_listen_backlog" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_set_timeout" : GioSocketClass.FFI.notnull GioSocketClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
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
    fun new family type' protocol =
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
    fun bind self address allowReuse =
      (
        GioSocketClass.FFI.withPtr
         &&&> GioSocketAddressClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        bind_
        (
          self
           & address
           & allowReuse
           & []
        )
    fun checkConnectResult self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) checkConnectResult_ (self & [])
    fun close self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) close_ (self & [])
    fun conditionCheck self condition = (GioSocketClass.FFI.withPtr &&&> GLibIOCondition.FFI.withVal ---> GLibIOCondition.FFI.fromVal) conditionCheck_ (self & condition)
    fun conditionWait self condition cancellable =
      (
        GioSocketClass.FFI.withPtr
         &&&> GLibIOCondition.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        GioSocketClass.FFI.withPtr
         &&&> GioSocketAddressClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
    fun listen self = (GioSocketClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) listen_ (self & [])
    fun receive self buffer size cancellable =
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
    fun receiveFrom self address buffer size cancellable =
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
    fun receiveWithBlocking self buffer size blocking cancellable =
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
    fun send self buffer cancellable =
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
    fun sendTo self address buffer cancellable =
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
    fun sendWithBlocking self buffer blocking cancellable =
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
    fun shutdown self shutdownRead shutdownWrite =
      (
        GioSocketClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
