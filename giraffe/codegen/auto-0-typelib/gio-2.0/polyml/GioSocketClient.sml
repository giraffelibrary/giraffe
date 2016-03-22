structure GioSocketClient :>
  GIO_SOCKET_CLIENT
    where type 'a class = 'a GioSocketClientClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type socket_family_t = GioSocketFamily.t
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type socket_protocol_t = GioSocketProtocol.t
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type socket_type_t = GioSocketType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_client_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_socket_client_new") (FFI.PolyML.cVoid --> GioSocketClientClass.PolyML.cPtr)
      val addApplicationProxy_ = call (load_sym libgio "g_socket_client_add_application_proxy") (GioSocketClientClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val connect_ =
        call (load_sym libgio "g_socket_client_connect")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioSocketConnectableClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectFinish_ =
        call (load_sym libgio "g_socket_client_connect_finish")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToHost_ =
        call (load_sym libgio "g_socket_client_connect_to_host")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToHostFinish_ =
        call (load_sym libgio "g_socket_client_connect_to_host_finish")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToService_ =
        call (load_sym libgio "g_socket_client_connect_to_service")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToServiceFinish_ =
        call (load_sym libgio "g_socket_client_connect_to_service_finish")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToUri_ =
        call (load_sym libgio "g_socket_client_connect_to_uri")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val connectToUriFinish_ =
        call (load_sym libgio "g_socket_client_connect_to_uri_finish")
          (
            GioSocketClientClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSocketConnectionClass.PolyML.cPtr
          )
      val getEnableProxy_ = call (load_sym libgio "g_socket_client_get_enable_proxy") (GioSocketClientClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFamily_ = call (load_sym libgio "g_socket_client_get_family") (GioSocketClientClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getLocalAddress_ = call (load_sym libgio "g_socket_client_get_local_address") (GioSocketClientClass.PolyML.cPtr --> GioSocketAddressClass.PolyML.cPtr)
      val getProtocol_ = call (load_sym libgio "g_socket_client_get_protocol") (GioSocketClientClass.PolyML.cPtr --> GioSocketProtocol.PolyML.cVal)
      val getSocketType_ = call (load_sym libgio "g_socket_client_get_socket_type") (GioSocketClientClass.PolyML.cPtr --> GioSocketType.PolyML.cVal)
      val getTimeout_ = call (load_sym libgio "g_socket_client_get_timeout") (GioSocketClientClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getTls_ = call (load_sym libgio "g_socket_client_get_tls") (GioSocketClientClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTlsValidationFlags_ = call (load_sym libgio "g_socket_client_get_tls_validation_flags") (GioSocketClientClass.PolyML.cPtr --> GioTlsCertificateFlags.PolyML.cVal)
      val setEnableProxy_ = call (load_sym libgio "g_socket_client_set_enable_proxy") (GioSocketClientClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFamily_ = call (load_sym libgio "g_socket_client_set_family") (GioSocketClientClass.PolyML.cPtr &&> GioSocketFamily.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLocalAddress_ = call (load_sym libgio "g_socket_client_set_local_address") (GioSocketClientClass.PolyML.cPtr &&> GioSocketAddressClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setProtocol_ = call (load_sym libgio "g_socket_client_set_protocol") (GioSocketClientClass.PolyML.cPtr &&> GioSocketProtocol.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSocketType_ = call (load_sym libgio "g_socket_client_set_socket_type") (GioSocketClientClass.PolyML.cPtr &&> GioSocketType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTimeout_ = call (load_sym libgio "g_socket_client_set_timeout") (GioSocketClientClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTls_ = call (load_sym libgio "g_socket_client_set_tls") (GioSocketClientClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTlsValidationFlags_ = call (load_sym libgio "g_socket_client_set_tls_validation_flags") (GioSocketClientClass.PolyML.cPtr &&> GioTlsCertificateFlags.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioSocketClientClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type socket_family_t = GioSocketFamily.t
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type socket_protocol_t = GioSocketProtocol.t
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type socket_type_t = GioSocketType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSocketClientClass.C.fromPtr true) new_ ()
    fun addApplicationProxy self protocol = (GioSocketClientClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addApplicationProxy_ (self & protocol)
    fun connect self connectable cancellable =
      (
        GioSocketClientClass.C.withPtr
         &&&> GioSocketConnectableClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
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
        GioSocketClientClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
      )
        connectFinish_
        (
          self
           & result
           & []
        )
    fun connectToHost self hostAndPort defaultPort cancellable =
      (
        GioSocketClientClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
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
        GioSocketClientClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
      )
        connectToHostFinish_
        (
          self
           & result
           & []
        )
    fun connectToService self domain service cancellable =
      (
        GioSocketClientClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
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
        GioSocketClientClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
      )
        connectToServiceFinish_
        (
          self
           & result
           & []
        )
    fun connectToUri self uri defaultPort cancellable =
      (
        GioSocketClientClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
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
        GioSocketClientClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
      )
        connectToUriFinish_
        (
          self
           & result
           & []
        )
    fun getEnableProxy self = (GioSocketClientClass.C.withPtr ---> FFI.Bool.C.fromVal) getEnableProxy_ self
    fun getFamily self = (GioSocketClientClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getLocalAddress self = (GioSocketClientClass.C.withPtr ---> GioSocketAddressClass.C.fromPtr false) getLocalAddress_ self
    fun getProtocol self = (GioSocketClientClass.C.withPtr ---> GioSocketProtocol.C.fromVal) getProtocol_ self
    fun getSocketType self = (GioSocketClientClass.C.withPtr ---> GioSocketType.C.fromVal) getSocketType_ self
    fun getTimeout self = (GioSocketClientClass.C.withPtr ---> FFI.UInt32.C.fromVal) getTimeout_ self
    fun getTls self = (GioSocketClientClass.C.withPtr ---> FFI.Bool.C.fromVal) getTls_ self
    fun getTlsValidationFlags self = (GioSocketClientClass.C.withPtr ---> GioTlsCertificateFlags.C.fromVal) getTlsValidationFlags_ self
    fun setEnableProxy self enable = (GioSocketClientClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnableProxy_ (self & enable)
    fun setFamily self family = (GioSocketClientClass.C.withPtr &&&> GioSocketFamily.C.withVal ---> I) setFamily_ (self & family)
    fun setLocalAddress self address = (GioSocketClientClass.C.withPtr &&&> GioSocketAddressClass.C.withPtr ---> I) setLocalAddress_ (self & address)
    fun setProtocol self protocol = (GioSocketClientClass.C.withPtr &&&> GioSocketProtocol.C.withVal ---> I) setProtocol_ (self & protocol)
    fun setSocketType self type' = (GioSocketClientClass.C.withPtr &&&> GioSocketType.C.withVal ---> I) setSocketType_ (self & type')
    fun setTimeout self timeout = (GioSocketClientClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setTimeout_ (self & timeout)
    fun setTls self tls = (GioSocketClientClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTls_ (self & tls)
    fun setTlsValidationFlags self flags = (GioSocketClientClass.C.withPtr &&&> GioTlsCertificateFlags.C.withVal ---> I) setTlsValidationFlags_ (self & flags)
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
