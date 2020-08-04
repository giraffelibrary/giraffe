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
    val getType_ = _import "g_socket_client_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_socket_client_new" : unit -> GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p;
    val addApplicationProxy_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_socket_client_add_application_proxy" :
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt16.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt16.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
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
              GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSocketConnectionClass.FFI.non_opt GioSocketConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEnableProxy_ = _import "g_socket_client_get_enable_proxy" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GBool.FFI.val_;
    val getFamily_ = _import "g_socket_client_get_family" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GioSocketFamily.FFI.val_;
    val getLocalAddress_ = _import "g_socket_client_get_local_address" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GioSocketAddressClass.FFI.non_opt GioSocketAddressClass.FFI.p;
    val getProtocol_ = _import "g_socket_client_get_protocol" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GioSocketProtocol.FFI.val_;
    val getProxyResolver_ = _import "g_socket_client_get_proxy_resolver" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GioProxyResolverClass.FFI.non_opt GioProxyResolverClass.FFI.p;
    val getSocketType_ = _import "g_socket_client_get_socket_type" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GioSocketType.FFI.val_;
    val getTimeout_ = _import "g_socket_client_get_timeout" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GUInt.FFI.val_;
    val getTls_ = _import "g_socket_client_get_tls" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GBool.FFI.val_;
    val getTlsValidationFlags_ = _import "g_socket_client_get_tls_validation_flags" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p -> GioTlsCertificateFlags.FFI.val_;
    val setEnableProxy_ = fn x1 & x2 => (_import "g_socket_client_set_enable_proxy" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFamily_ = fn x1 & x2 => (_import "g_socket_client_set_family" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GioSocketFamily.FFI.val_ -> unit;) (x1, x2)
    val setLocalAddress_ = fn x1 & x2 => (_import "g_socket_client_set_local_address" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GioSocketAddressClass.FFI.opt GioSocketAddressClass.FFI.p -> unit;) (x1, x2)
    val setProtocol_ = fn x1 & x2 => (_import "g_socket_client_set_protocol" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GioSocketProtocol.FFI.val_ -> unit;) (x1, x2)
    val setProxyResolver_ = fn x1 & x2 => (_import "g_socket_client_set_proxy_resolver" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GioProxyResolverClass.FFI.opt GioProxyResolverClass.FFI.p -> unit;) (x1, x2)
    val setSocketType_ = fn x1 & x2 => (_import "g_socket_client_set_socket_type" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GioSocketType.FFI.val_ -> unit;) (x1, x2)
    val setTimeout_ = fn x1 & x2 => (_import "g_socket_client_set_timeout" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setTls_ = fn x1 & x2 => (_import "g_socket_client_set_tls" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTlsValidationFlags_ = fn x1 & x2 => (_import "g_socket_client_set_tls_validation_flags" : GioSocketClientClass.FFI.non_opt GioSocketClientClass.FFI.p * GioTlsCertificateFlags.FFI.val_ -> unit;) (x1, x2)
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
    fun addApplicationProxy self protocol = (GioSocketClientClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addApplicationProxy_ (self & protocol)
    fun connect self (connectable, cancellable) =
      (
        GioSocketClientClass.FFI.withPtr false
         &&&> GioSocketConnectableClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioSocketClientClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioSocketClientClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioSocketClientClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioSocketClientClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioSocketClientClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioSocketClientClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioSocketClientClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioSocketConnectionClass.FFI.fromPtr true
      )
        connectToUriFinish_
        (
          self
           & result
           & []
        )
    fun getEnableProxy self = (GioSocketClientClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEnableProxy_ self
    fun getFamily self = (GioSocketClientClass.FFI.withPtr false ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getLocalAddress self = (GioSocketClientClass.FFI.withPtr false ---> GioSocketAddressClass.FFI.fromPtr false) getLocalAddress_ self
    fun getProtocol self = (GioSocketClientClass.FFI.withPtr false ---> GioSocketProtocol.FFI.fromVal) getProtocol_ self
    fun getProxyResolver self = (GioSocketClientClass.FFI.withPtr false ---> GioProxyResolverClass.FFI.fromPtr false) getProxyResolver_ self
    fun getSocketType self = (GioSocketClientClass.FFI.withPtr false ---> GioSocketType.FFI.fromVal) getSocketType_ self
    fun getTimeout self = (GioSocketClientClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getTimeout_ self
    fun getTls self = (GioSocketClientClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTls_ self
    fun getTlsValidationFlags self = (GioSocketClientClass.FFI.withPtr false ---> GioTlsCertificateFlags.FFI.fromVal) getTlsValidationFlags_ self
    fun setEnableProxy self enable = (GioSocketClientClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEnableProxy_ (self & enable)
    fun setFamily self family = (GioSocketClientClass.FFI.withPtr false &&&> GioSocketFamily.FFI.withVal ---> I) setFamily_ (self & family)
    fun setLocalAddress self address = (GioSocketClientClass.FFI.withPtr false &&&> GioSocketAddressClass.FFI.withOptPtr false ---> I) setLocalAddress_ (self & address)
    fun setProtocol self protocol = (GioSocketClientClass.FFI.withPtr false &&&> GioSocketProtocol.FFI.withVal ---> I) setProtocol_ (self & protocol)
    fun setProxyResolver self proxyResolver = (GioSocketClientClass.FFI.withPtr false &&&> GioProxyResolverClass.FFI.withOptPtr false ---> I) setProxyResolver_ (self & proxyResolver)
    fun setSocketType self type' = (GioSocketClientClass.FFI.withPtr false &&&> GioSocketType.FFI.withVal ---> I) setSocketType_ (self & type')
    fun setTimeout self timeout = (GioSocketClientClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setTimeout_ (self & timeout)
    fun setTls self tls = (GioSocketClientClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTls_ (self & tls)
    fun setTlsValidationFlags self flags = (GioSocketClientClass.FFI.withPtr false &&&> GioTlsCertificateFlags.FFI.withVal ---> I) setTlsValidationFlags_ (self & flags)
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
          set = fn x => set "enable-proxy" boolean x,
          new = fn x => new "enable-proxy" boolean x
        }
      val familyProp =
        {
          get = fn x => get "family" GioSocketFamily.t x,
          set = fn x => set "family" GioSocketFamily.t x,
          new = fn x => new "family" GioSocketFamily.t x
        }
      val localAddressProp =
        {
          get = fn x => get "local-address" GioSocketAddressClass.tOpt x,
          set = fn x => set "local-address" GioSocketAddressClass.tOpt x,
          new = fn x => new "local-address" GioSocketAddressClass.tOpt x
        }
      val protocolProp =
        {
          get = fn x => get "protocol" GioSocketProtocol.t x,
          set = fn x => set "protocol" GioSocketProtocol.t x,
          new = fn x => new "protocol" GioSocketProtocol.t x
        }
      val proxyResolverProp =
        {
          get = fn x => get "proxy-resolver" GioProxyResolverClass.tOpt x,
          set = fn x => set "proxy-resolver" GioProxyResolverClass.tOpt x,
          new = fn x => new "proxy-resolver" GioProxyResolverClass.tOpt x
        }
      val timeoutProp =
        {
          get = fn x => get "timeout" uint x,
          set = fn x => set "timeout" uint x,
          new = fn x => new "timeout" uint x
        }
      val tlsProp =
        {
          get = fn x => get "tls" boolean x,
          set = fn x => set "tls" boolean x,
          new = fn x => new "tls" boolean x
        }
      val tlsValidationFlagsProp =
        {
          get = fn x => get "tls-validation-flags" GioTlsCertificateFlags.t x,
          set = fn x => set "tls-validation-flags" GioTlsCertificateFlags.t x,
          new = fn x => new "tls-validation-flags" GioTlsCertificateFlags.t x
        }
      val typeProp =
        {
          get = fn x => get "type" GioSocketType.t x,
          set = fn x => set "type" GioSocketType.t x,
          new = fn x => new "type" GioSocketType.t x
        }
    end
  end
