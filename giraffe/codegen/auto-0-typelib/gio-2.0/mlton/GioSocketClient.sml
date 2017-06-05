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
    val getType_ = _import "g_socket_client_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_socket_client_new" : unit -> GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p;
    val addApplicationProxy_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_socket_client_add_application_proxy" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val connect_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_socket_client_connect" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * GioSocketConnectableClass.FFI.notnull GioSocketConnectableClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
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
            _import "g_socket_client_connect_finish" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val connectToHost_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_socket_client_connect_to_host" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt16.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val connectToHostFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_client_connect_to_host_finish" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val connectToService_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_g_socket_client_connect_to_service" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
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
    val connectToServiceFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_client_connect_to_service_finish" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val connectToUri_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_socket_client_connect_to_uri" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt16.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val connectToUriFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_client_connect_to_uri_finish" :
              GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEnableProxy_ = _import "g_socket_client_get_enable_proxy" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p -> GBool.FFI.val_;
    val getFamily_ = _import "g_socket_client_get_family" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p -> GioSocketFamily.FFI.val_;
    val getLocalAddress_ = _import "g_socket_client_get_local_address" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p -> GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p;
    val getProtocol_ = _import "g_socket_client_get_protocol" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p -> GioSocketProtocol.FFI.val_;
    val getSocketType_ = _import "g_socket_client_get_socket_type" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p -> GioSocketType.FFI.val_;
    val getTimeout_ = _import "g_socket_client_get_timeout" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p -> GUInt32.FFI.val_;
    val getTls_ = _import "g_socket_client_get_tls" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p -> GBool.FFI.val_;
    val getTlsValidationFlags_ = _import "g_socket_client_get_tls_validation_flags" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p -> GioTlsCertificateFlags.FFI.val_;
    val setEnableProxy_ = fn x1 & x2 => (_import "g_socket_client_set_enable_proxy" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFamily_ = fn x1 & x2 => (_import "g_socket_client_set_family" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p * GioSocketFamily.FFI.val_ -> unit;) (x1, x2)
    val setLocalAddress_ = fn x1 & x2 => (_import "g_socket_client_set_local_address" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p * GioSocketAddressClass.FFI.notnull GioSocketAddressClass.FFI.p -> unit;) (x1, x2)
    val setProtocol_ = fn x1 & x2 => (_import "g_socket_client_set_protocol" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p * GioSocketProtocol.FFI.val_ -> unit;) (x1, x2)
    val setSocketType_ = fn x1 & x2 => (_import "g_socket_client_set_socket_type" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p * GioSocketType.FFI.val_ -> unit;) (x1, x2)
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_client_set_timeout" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setTls_ = fn x1 & x2 => (_import "g_socket_client_set_tls" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTlsValidationFlags_ = fn x1 & x2 => (_import "g_socket_client_set_tls_validation_flags" : GioSocketClientClass.FFI.notnull GioSocketClientClass.FFI.p * GioTlsCertificateFlags.FFI.val_ -> unit;) (x1, x2)
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioSocketClientClass.FFI.fromPtr true) new_ ()
    fun addApplicationProxy self protocol = (GioSocketClientClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addApplicationProxy_ (self & protocol)
    fun connect self connectable cancellable =
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
    fun connectToHost self hostAndPort defaultPort cancellable =
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
    fun connectToService self domain service cancellable =
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
    fun connectToUri self uri defaultPort cancellable =
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
    fun getSocketType self = (GioSocketClientClass.FFI.withPtr ---> GioSocketType.FFI.fromVal) getSocketType_ self
    fun getTimeout self = (GioSocketClientClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getTimeout_ self
    fun getTls self = (GioSocketClientClass.FFI.withPtr ---> GBool.FFI.fromVal) getTls_ self
    fun getTlsValidationFlags self = (GioSocketClientClass.FFI.withPtr ---> GioTlsCertificateFlags.FFI.fromVal) getTlsValidationFlags_ self
    fun setEnableProxy self enable = (GioSocketClientClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setEnableProxy_ (self & enable)
    fun setFamily self family = (GioSocketClientClass.FFI.withPtr &&&> GioSocketFamily.FFI.withVal ---> I) setFamily_ (self & family)
    fun setLocalAddress self address = (GioSocketClientClass.FFI.withPtr &&&> GioSocketAddressClass.FFI.withPtr ---> I) setLocalAddress_ (self & address)
    fun setProtocol self protocol = (GioSocketClientClass.FFI.withPtr &&&> GioSocketProtocol.FFI.withVal ---> I) setProtocol_ (self & protocol)
    fun setSocketType self type' = (GioSocketClientClass.FFI.withPtr &&&> GioSocketType.FFI.withVal ---> I) setSocketType_ (self & type')
    fun setTimeout self timeout = (GioSocketClientClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setTimeout_ (self & timeout)
    fun setTls self tls = (GioSocketClientClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setTls_ (self & tls)
    fun setTlsValidationFlags self flags = (GioSocketClientClass.FFI.withPtr &&&> GioTlsCertificateFlags.FFI.withVal ---> I) setTlsValidationFlags_ (self & flags)
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
