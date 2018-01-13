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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val factoryLookupType_ =
        call (getSymbol "g_socket_connection_factory_lookup_type")
          (
            GioSocketFamily.PolyML.cVal
             &&> GioSocketType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GObjectType.PolyML.cVal
          )
      val factoryRegisterType_ =
        call (getSymbol "g_socket_connection_factory_register_type")
          (
            GObjectType.PolyML.cVal
             &&> GioSocketFamily.PolyML.cVal
             &&> GioSocketType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val connect_ =
        call (getSymbol "g_socket_connection_connect")
          (
            GioSocketConnectionClass.PolyML.cPtr
             &&> GioSocketAddressClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val connectFinish_ =
        call (getSymbol "g_socket_connection_connect_finish")
          (
            GioSocketConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getLocalAddress_ = call (getSymbol "g_socket_connection_get_local_address") (GioSocketConnectionClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getRemoteAddress_ = call (getSymbol "g_socket_connection_get_remote_address") (GioSocketConnectionClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getSocket_ = call (getSymbol "g_socket_connection_get_socket") (GioSocketConnectionClass.PolyML.cPtr --> GioSocketClass.PolyML.cPtr)
      val isConnected_ = call (getSymbol "g_socket_connection_is_connected") (GioSocketConnectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
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
          set = fn x => set "socket" GioSocketClass.tOpt x
        }
    end
  end
