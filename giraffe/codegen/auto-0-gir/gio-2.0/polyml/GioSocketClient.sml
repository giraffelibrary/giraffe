structure GioSocketClient :>
  GIO_SOCKET_CLIENT
    where type 'a class_t = 'a GioSocketClientClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t
    where type socket_family_t = GioSocketFamily.t
    where type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    where type socket_protocol_t = GioSocketProtocol.t
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t
    where type socket_type_t = GioSocketType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_client_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_socket_client_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addApplicationProxy_ = call (load_sym libgio "g_socket_client_add_application_proxy") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val connect_ =
        call (load_sym libgio "g_socket_client_connect")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val connectFinish_ =
        call (load_sym libgio "g_socket_client_connect_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val connectToHost_ =
        call (load_sym libgio "g_socket_client_connect_to_host")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val connectToHostFinish_ =
        call (load_sym libgio "g_socket_client_connect_to_host_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val connectToService_ =
        call (load_sym libgio "g_socket_client_connect_to_service")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val connectToServiceFinish_ =
        call (load_sym libgio "g_socket_client_connect_to_service_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val connectToUri_ =
        call (load_sym libgio "g_socket_client_connect_to_uri")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val connectToUriFinish_ =
        call (load_sym libgio "g_socket_client_connect_to_uri_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getEnableProxy_ = call (load_sym libgio "g_socket_client_get_enable_proxy") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFamily_ = call (load_sym libgio "g_socket_client_get_family") (GObjectObjectClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getLocalAddress_ = call (load_sym libgio "g_socket_client_get_local_address") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getProtocol_ = call (load_sym libgio "g_socket_client_get_protocol") (GObjectObjectClass.PolyML.cPtr --> GioSocketProtocol.PolyML.cVal)
      val getSocketType_ = call (load_sym libgio "g_socket_client_get_socket_type") (GObjectObjectClass.PolyML.cPtr --> GioSocketType.PolyML.cVal)
      val getTimeout_ = call (load_sym libgio "g_socket_client_get_timeout") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getTls_ = call (load_sym libgio "g_socket_client_get_tls") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTlsValidationFlags_ = call (load_sym libgio "g_socket_client_get_tls_validation_flags") (GObjectObjectClass.PolyML.cPtr --> GioTlsCertificateFlags.PolyML.cVal)
      val setEnableProxy_ = call (load_sym libgio "g_socket_client_set_enable_proxy") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFamily_ = call (load_sym libgio "g_socket_client_set_family") (GObjectObjectClass.PolyML.cPtr &&> GioSocketFamily.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLocalAddress_ = call (load_sym libgio "g_socket_client_set_local_address") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setProtocol_ = call (load_sym libgio "g_socket_client_set_protocol") (GObjectObjectClass.PolyML.cPtr &&> GioSocketProtocol.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSocketType_ = call (load_sym libgio "g_socket_client_set_socket_type") (GObjectObjectClass.PolyML.cPtr &&> GioSocketType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTimeout_ = call (load_sym libgio "g_socket_client_set_timeout") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTls_ = call (load_sym libgio "g_socket_client_set_tls") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTlsValidationFlags_ = call (load_sym libgio "g_socket_client_set_tls_validation_flags") (GObjectObjectClass.PolyML.cPtr &&> GioTlsCertificateFlags.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioSocketClientClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a socket_connection_class_t = 'a GioSocketConnectionClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type socket_family_t = GioSocketFamily.t
    type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    type socket_protocol_t = GioSocketProtocol.t
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type socket_type_t = GioSocketType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSocketClientClass.C.fromPtr true) new_ ()
    fun addApplicationProxy self protocol = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addApplicationProxy_ (self & protocol)
    fun connect self connectable cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.C.fromPtr true
      )
        connectToUriFinish_
        (
          self
           & result
           & []
        )
    fun getEnableProxy self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getEnableProxy_ self
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getLocalAddress self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressClass.C.fromPtr false) getLocalAddress_ self
    fun getProtocol self = (GObjectObjectClass.C.withPtr ---> GioSocketProtocol.C.fromVal) getProtocol_ self
    fun getSocketType self = (GObjectObjectClass.C.withPtr ---> GioSocketType.C.fromVal) getSocketType_ self
    fun getTimeout self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getTimeout_ self
    fun getTls self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getTls_ self
    fun getTlsValidationFlags self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateFlags.C.fromVal) getTlsValidationFlags_ self
    fun setEnableProxy self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnableProxy_ (self & enable)
    fun setFamily self family = (GObjectObjectClass.C.withPtr &&&> GioSocketFamily.C.withVal ---> I) setFamily_ (self & family)
    fun setLocalAddress self address = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setLocalAddress_ (self & address)
    fun setProtocol self protocol = (GObjectObjectClass.C.withPtr &&&> GioSocketProtocol.C.withVal ---> I) setProtocol_ (self & protocol)
    fun setSocketType self type' = (GObjectObjectClass.C.withPtr &&&> GioSocketType.C.withVal ---> I) setSocketType_ (self & type')
    fun setTimeout self timeout = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setTimeout_ (self & timeout)
    fun setTls self tls = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTls_ (self & tls)
    fun setTlsValidationFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioTlsCertificateFlags.C.withVal ---> I) setTlsValidationFlags_ (self & flags)
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
