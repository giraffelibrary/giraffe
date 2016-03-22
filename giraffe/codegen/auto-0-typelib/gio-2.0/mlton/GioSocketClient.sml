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
    val getType_ = _import "g_socket_client_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_socket_client_new" : unit -> GioSocketClientClass.C.notnull GioSocketClientClass.C.p;
    val addApplicationProxy_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_socket_client_add_application_proxy" :
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * GioSocketConnectableClass.C.notnull GioSocketConnectableClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
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
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
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
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt16.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
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
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
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
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
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
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
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
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt16.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
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
              GioSocketClientClass.C.notnull GioSocketClientClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEnableProxy_ = _import "g_socket_client_get_enable_proxy" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p -> FFI.Bool.C.val_;
    val getFamily_ = _import "g_socket_client_get_family" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p -> GioSocketFamily.C.val_;
    val getLocalAddress_ = _import "g_socket_client_get_local_address" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p -> GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p;
    val getProtocol_ = _import "g_socket_client_get_protocol" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p -> GioSocketProtocol.C.val_;
    val getSocketType_ = _import "g_socket_client_get_socket_type" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p -> GioSocketType.C.val_;
    val getTimeout_ = _import "g_socket_client_get_timeout" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p -> FFI.UInt32.C.val_;
    val getTls_ = _import "g_socket_client_get_tls" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p -> FFI.Bool.C.val_;
    val getTlsValidationFlags_ = _import "g_socket_client_get_tls_validation_flags" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p -> GioTlsCertificateFlags.C.val_;
    val setEnableProxy_ = fn x1 & x2 => (_import "g_socket_client_set_enable_proxy" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFamily_ = fn x1 & x2 => (_import "g_socket_client_set_family" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p * GioSocketFamily.C.val_ -> unit;) (x1, x2)
    val setLocalAddress_ = fn x1 & x2 => (_import "g_socket_client_set_local_address" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p * GioSocketAddressClass.C.notnull GioSocketAddressClass.C.p -> unit;) (x1, x2)
    val setProtocol_ = fn x1 & x2 => (_import "g_socket_client_set_protocol" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p * GioSocketProtocol.C.val_ -> unit;) (x1, x2)
    val setSocketType_ = fn x1 & x2 => (_import "g_socket_client_set_socket_type" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p * GioSocketType.C.val_ -> unit;) (x1, x2)
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_client_set_timeout" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setTls_ = fn x1 & x2 => (_import "g_socket_client_set_tls" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTlsValidationFlags_ = fn x1 & x2 => (_import "g_socket_client_set_tls_validation_flags" : GioSocketClientClass.C.notnull GioSocketClientClass.C.p * GioTlsCertificateFlags.C.val_ -> unit;) (x1, x2)
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
