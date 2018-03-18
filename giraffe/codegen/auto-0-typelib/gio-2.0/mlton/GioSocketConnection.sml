structure GioSocketConnection :>
  GIO_SOCKET_CONNECTION
    where type 'a class = 'a GioSocketConnectionClass.class
    where type socket_type_t = GioSocketType.t
    where type socket_family_t = GioSocketFamily.t
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type 'a socket_class = 'a GioSocketClass.class =
  struct
    val getType_ = _import "g_socket_connection_get_type" : unit -> GObjectType.FFI.val_;
    val factoryLookupType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_connection_factory_lookup_type" :
              GioSocketFamily.FFI.val_
               * GioSocketType.FFI.val_
               * GInt32.FFI.val_
               -> GObjectType.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val factoryRegisterType_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_connection_factory_register_type" :
              GObjectType.FFI.val_
               * GioSocketFamily.FFI.val_
               * GioSocketType.FFI.val_
               * GInt32.FFI.val_
               -> unit;
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
            _import "g_socket_connection_connect" :
              GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p
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
    val connectFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_connection_connect_finish" :
              GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getLocalAddress_ = fn x1 & x2 => (_import "g_socket_connection_get_local_address" : GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;) (x1, x2)
    val getRemoteAddress_ = fn x1 & x2 => (_import "g_socket_connection_get_remote_address" : GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;) (x1, x2)
    val getSocket_ = _import "g_socket_connection_get_socket" : GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p -> GioSocketClass.FFI.notnull GioSocketClass.FFI.p;
    val isConnected_ = _import "g_socket_connection_is_connected" : GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioSocketConnectionClass.class
    type socket_type_t = GioSocketType.t
    type socket_family_t = GioSocketFamily.t
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun factoryLookupType
      (
        family,
        type',
        protocolId
      ) =
      (
        GioSocketFamily.FFI.withVal
         &&&> GioSocketType.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GObjectType.FFI.fromVal
      )
        factoryLookupType_
        (
          family
           & type'
           & protocolId
        )
    fun factoryRegisterType
      (
        gType,
        family,
        type',
        protocol
      ) =
      (
        GObjectType.FFI.withVal
         &&&> GioSocketFamily.FFI.withVal
         &&&> GioSocketType.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        factoryRegisterType_
        (
          gType
           & family
           & type'
           & protocol
        )
    fun connect self (address, cancellable) =
      (
        GioSocketConnectionClass.FFI.withPtr
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
    fun connectFinish self result =
      (
        GioSocketConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        connectFinish_
        (
          self
           & result
           & []
        )
    fun getLocalAddress self = (GioSocketConnectionClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.FFI.fromPtr true) getLocalAddress_ (self & [])
    fun getRemoteAddress self = (GioSocketConnectionClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.FFI.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocket self = (GioSocketConnectionClass.FFI.withPtr ---> GioSocketClass.FFI.fromPtr false) getSocket_ self
    fun isConnected self = (GioSocketConnectionClass.FFI.withPtr ---> GBool.FFI.fromVal) isConnected_ self
    local
      open Property
    in
      val socketProp =
        {
          get = fn x => get "socket" GioSocketClass.tOpt x,
          new = fn x => new "socket" GioSocketClass.tOpt x
        }
    end
  end
