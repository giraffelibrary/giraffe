structure GioSocketClient :>
  GIO_SOCKET_CLIENT
    where type 'a class = 'a GioSocketClientClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type socket_client_event_t = GioSocketClientEvent.t
    where type socket_family_t = GioSocketFamily.t
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type socket_protocol_t = GioSocketProtocol.t
    where type 'a proxy_resolver_class = 'a GioProxyResolverClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type socket_type_t = GioSocketType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_socket_client_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_socket_client_new") (cVoid --> GioSocketClientClass.PolyML.cPtr)
      val addApplicationProxy_ = call (getSymbol "g_socket_client_add_application_proxy") (GioSocketClientClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val connect_ =
        call (getSymbol "g_socket_client_connect")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioSocketConnectableClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectFinish_ =
        call (getSymbol "g_socket_client_connect_finish")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToHost_ =
        call (getSymbol "g_socket_client_connect_to_host")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt16.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToHostFinish_ =
        call (getSymbol "g_socket_client_connect_to_host_finish")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToService_ =
        call (getSymbol "g_socket_client_connect_to_service")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToServiceFinish_ =
        call (getSymbol "g_socket_client_connect_to_service_finish")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToUri_ =
        call (getSymbol "g_socket_client_connect_to_uri")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt16.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToUriFinish_ =
        call (getSymbol "g_socket_client_connect_to_uri_finish")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val getEnableProxy_ = call (getSymbol "g_socket_client_get_enable_proxy") (GioSocketClientClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFamily_ = call (getSymbol "g_socket_client_get_family") (GioSocketClientClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getLocalAddress_ = call (getSymbol "g_socket_client_get_local_address") (GioSocketClientClass.PolyML.cPtr --> GioSocketAddressClass.PolyML.cPtr)
      val getProtocol_ = call (getSymbol "g_socket_client_get_protocol") (GioSocketClientClass.PolyML.cPtr --> GioSocketProtocol.PolyML.cVal)
      val getProxyResolver_ = call (getSymbol "g_socket_client_get_proxy_resolver") (GioSocketClientClass.PolyML.cPtr --> GioProxyResolverClass.PolyML.cPtr)
      val getSocketType_ = call (getSymbol "g_socket_client_get_socket_type") (GioSocketClientClass.PolyML.cPtr --> GioSocketType.PolyML.cVal)
      val getTimeout_ = call (getSymbol "g_socket_client_get_timeout") (GioSocketClientClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getTls_ = call (getSymbol "g_socket_client_get_tls") (GioSocketClientClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTlsValidationFlags_ = call (getSymbol "g_socket_client_get_tls_validation_flags") (GioSocketClientClass.PolyML.cPtr --> GioTlsCertificateFlags.PolyML.cVal)
      val setEnableProxy_ = call (getSymbol "g_socket_client_set_enable_proxy") (GioSocketClientClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFamily_ = call (getSymbol "g_socket_client_set_family") (GioSocketClientClass.PolyML.cPtr &&> GioSocketFamily.PolyML.cVal --> cVoid)
      val setLocalAddress_ = call (getSymbol "g_socket_client_set_local_address") (GioSocketClientClass.PolyML.cPtr &&> GioSocketAddressClass.PolyML.cOptPtr --> cVoid)
      val setProtocol_ = call (getSymbol "g_socket_client_set_protocol") (GioSocketClientClass.PolyML.cPtr &&> GioSocketProtocol.PolyML.cVal --> cVoid)
      val setProxyResolver_ = call (getSymbol "g_socket_client_set_proxy_resolver") (GioSocketClientClass.PolyML.cPtr &&> GioProxyResolverClass.PolyML.cOptPtr --> cVoid)
      val setSocketType_ = call (getSymbol "g_socket_client_set_socket_type") (GioSocketClientClass.PolyML.cPtr &&> GioSocketType.PolyML.cVal --> cVoid)
      val setTimeout_ = call (getSymbol "g_socket_client_set_timeout") (GioSocketClientClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setTls_ = call (getSymbol "g_socket_client_set_tls") (GioSocketClientClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTlsValidationFlags_ = call (getSymbol "g_socket_client_set_tls_validation_flags") (GioSocketClientClass.PolyML.cPtr &&> GioTlsCertificateFlags.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioSocketClientClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type socket_client_event_t = GioSocketClientEvent.t
    type socket_family_t = GioSocketFamily.t
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type socket_protocol_t = GioSocketProtocol.t
    type 'a proxy_resolver_class = 'a GioProxyResolverClass.class
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type socket_type_t = GioSocketType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioSocketClientClass.FFI.fromPtr true) new_ ()
    fun addApplicationProxy self protocol = (GioSocketClientClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addApplicationProxy_ (self & protocol)
    fun connect self (connectable, cancellable) =
      (
        GioSocketClientClass.FFI.withPtr
         &&&> GioSocketConnectableClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connect_
        (
          self
           & connectable
           & cancellable
           & []
        )
    fun connectFinish self result =
      (
        GioSocketClientClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connectFinish_
        (
          self
           & result
           & []
        )
    fun connectToHost
      self
      (
        hostAndPort,
        defaultPort,
        cancellable
      ) =
      (
        GioSocketClientClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connectToHost_
        (
          self
           & hostAndPort
           & defaultPort
           & cancellable
           & []
        )
    fun connectToHostFinish self result =
      (
        GioSocketClientClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connectToHostFinish_
        (
          self
           & result
           & []
        )
    fun connectToService
      self
      (
        domain,
        service,
        cancellable
      ) =
      (
        GioSocketClientClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connectToService_
        (
          self
           & domain
           & service
           & cancellable
           & []
        )
    fun connectToServiceFinish self result =
      (
        GioSocketClientClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connectToServiceFinish_
        (
          self
           & result
           & []
        )
    fun connectToUri
      self
      (
        uri,
        defaultPort,
        cancellable
      ) =
      (
        GioSocketClientClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connectToUri_
        (
          self
           & uri
           & defaultPort
           & cancellable
           & []
        )
    fun connectToUriFinish self result =
      (
        GioSocketClientClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connectToUriFinish_
        (
          self
           & result
           & []
        )
    fun getEnableProxy self = (GioSocketClientClass.FFI.withPtr ---> GBool.FFI.fromVal) getEnableProxy_ self
    fun getFamily self = (GioSocketClientClass.FFI.withPtr ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getLocalAddress self = (GioSocketClientClass.FFI.withPtr ---> GioSocketAddressClass.FFI.fromPtr false) getLocalAddress_ self
    fun getProtocol self = (GioSocketClientClass.FFI.withPtr ---> GioSocketProtocol.FFI.fromVal) getProtocol_ self
    fun getProxyResolver self = (GioSocketClientClass.FFI.withPtr ---> GioProxyResolverClass.FFI.fromPtr false) getProxyResolver_ self
    fun getSocketType self = (GioSocketClientClass.FFI.withPtr ---> GioSocketType.FFI.fromVal) getSocketType_ self
    fun getTimeout self = (GioSocketClientClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getTimeout_ self
    fun getTls self = (GioSocketClientClass.FFI.withPtr ---> GBool.FFI.fromVal) getTls_ self
    fun getTlsValidationFlags self = (GioSocketClientClass.FFI.withPtr ---> GioTlsCertificateFlags.FFI.fromVal) getTlsValidationFlags_ self
    fun setEnableProxy self enable = (GioSocketClientClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setEnableProxy_ (self & enable)
    fun setFamily self family = (GioSocketClientClass.FFI.withPtr &&&> GioSocketFamily.FFI.withVal ---> I) setFamily_ (self & family)
    fun setLocalAddress self address = (GioSocketClientClass.FFI.withPtr &&&> GioSocketAddressClass.FFI.withOptPtr ---> I) setLocalAddress_ (self & address)
    fun setProtocol self protocol = (GioSocketClientClass.FFI.withPtr &&&> GioSocketProtocol.FFI.withVal ---> I) setProtocol_ (self & protocol)
    fun setProxyResolver self proxyResolver = (GioSocketClientClass.FFI.withPtr &&&> GioProxyResolverClass.FFI.withOptPtr ---> I) setProxyResolver_ (self & proxyResolver)
    fun setSocketType self type' = (GioSocketClientClass.FFI.withPtr &&&> GioSocketType.FFI.withVal ---> I) setSocketType_ (self & type')
    fun setTimeout self timeout = (GioSocketClientClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setTimeout_ (self & timeout)
    fun setTls self tls = (GioSocketClientClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setTls_ (self & tls)
    fun setTlsValidationFlags self flags = (GioSocketClientClass.FFI.withPtr &&&> GioTlsCertificateFlags.FFI.withVal ---> I) setTlsValidationFlags_ (self & flags)
    local
      open ClosureMarshal Signal
    in
      fun eventSig f =
        signal "event"
          (
            get 0w1 GioSocketClientEvent.t
             &&&> get 0w2 GioSocketConnectableClass.t
             &&&> get 0w3 GioIOStreamClass.tOpt
             ---> ret_void
          )
          (
            fn
              event
               & connectable
               & connection =>
                f
                  (
                    event,
                    connectable,
                    connection
                  )
          )
    end
    local
      open Property
    in
      val enableProxyProp =
        {
          get = fn x => get "enable-proxy" boolean x,
          set = fn x => set "enable-proxy" boolean x
        }
      val familyProp =
        {
          get = fn x => get "family" GioSocketFamily.t x,
          set = fn x => set "family" GioSocketFamily.t x
        }
      val localAddressProp =
        {
          get = fn x => get "local-address" GioSocketAddressClass.tOpt x,
          set = fn x => set "local-address" GioSocketAddressClass.tOpt x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" GioSocketProtocol.t x,
          set = fn x => set "protocol" GioSocketProtocol.t x
        }
      val proxyResolverProp =
        {
          get = fn x => get "proxy-resolver" GioProxyResolverClass.tOpt x,
          set = fn x => set "proxy-resolver" GioProxyResolverClass.tOpt x
        }
      val timeoutProp =
        {
          get = fn x => get "timeout" uint x,
          set = fn x => set "timeout" uint x
        }
      val tlsProp =
        {
          get = fn x => get "tls" boolean x,
          set = fn x => set "tls" boolean x
        }
      val tlsValidationFlagsProp =
        {
          get = fn x => get "tls-validation-flags" GioTlsCertificateFlags.t x,
          set = fn x => set "tls-validation-flags" GioTlsCertificateFlags.t x
        }
      val typeProp =
        {
          get = fn x => get "type" GioSocketType.t x,
          set = fn x => set "type" GioSocketType.t x
        }
    end
  end
