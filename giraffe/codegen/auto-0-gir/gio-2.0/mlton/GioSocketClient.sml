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
    val getType_ = _import "g_socket_client_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_socket_client_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addApplicationProxy_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_socket_client_add_application_proxy" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt16.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt16.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEnableProxy_ = _import "g_socket_client_get_enable_proxy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getFamily_ = _import "g_socket_client_get_family" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketFamily.C.val_;
    val getLocalAddress_ = _import "g_socket_client_get_local_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getProtocol_ = _import "g_socket_client_get_protocol" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketProtocol.C.val_;
    val getSocketType_ = _import "g_socket_client_get_socket_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketType.C.val_;
    val getTimeout_ = _import "g_socket_client_get_timeout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getTls_ = _import "g_socket_client_get_tls" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getTlsValidationFlags_ = _import "g_socket_client_get_tls_validation_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioTlsCertificateFlags.C.val_;
    val setEnableProxy_ = fn x1 & x2 => (_import "g_socket_client_set_enable_proxy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setFamily_ = fn x1 & x2 => (_import "g_socket_client_set_family" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioSocketFamily.C.val_ -> unit;) (x1, x2)
    val setLocalAddress_ = fn x1 & x2 => (_import "g_socket_client_set_local_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setProtocol_ = fn x1 & x2 => (_import "g_socket_client_set_protocol" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioSocketProtocol.C.val_ -> unit;) (x1, x2)
    val setSocketType_ = fn x1 & x2 => (_import "g_socket_client_set_socket_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioSocketType.C.val_ -> unit;) (x1, x2)
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_client_set_timeout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setTls_ = fn x1 & x2 => (_import "g_socket_client_set_tls" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTlsValidationFlags_ = fn x1 & x2 => (_import "g_socket_client_set_tls_validation_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioTlsCertificateFlags.C.val_ -> unit;) (x1, x2)
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
