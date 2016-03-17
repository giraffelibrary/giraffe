structure GioTlsClientConnection :>
  GIO_TLS_CLIENT_CONNECTION
    where type 'a class = 'a GioTlsClientConnectionClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t =
  struct
    val getType_ = _import "g_tls_client_connection_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_client_connection_new" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getServerIdentity_ = _import "g_tls_client_connection_get_server_identity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getUseSsl3_ = _import "g_tls_client_connection_get_use_ssl3" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getValidationFlags_ = _import "g_tls_client_connection_get_validation_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioTlsCertificateFlags.C.val_;
    val setServerIdentity_ = fn x1 & x2 => (_import "g_tls_client_connection_set_server_identity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setUseSsl3_ = fn x1 & x2 => (_import "g_tls_client_connection_set_use_ssl3" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setValidationFlags_ = fn x1 & x2 => (_import "g_tls_client_connection_set_validation_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioTlsCertificateFlags.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioTlsClientConnectionClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIoStream serverIdentity =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        new_
        (
          baseIoStream
           & serverIdentity
           & []
        )
    fun getServerIdentity self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) getServerIdentity_ self
    fun getUseSsl3 self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseSsl3_ self
    fun getValidationFlags self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateFlags.C.fromVal) getValidationFlags_ self
    fun setServerIdentity self identity = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setServerIdentity_ (self & identity)
    fun setUseSsl3 self useSsl3 = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseSsl3_ (self & useSsl3)
    fun setValidationFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioTlsCertificateFlags.C.withVal ---> I) setValidationFlags_ (self & flags)
    local
      open Property
    in
      val serverIdentityProp =
        {
          get = fn x => get "server-identity" GioSocketConnectableClass.tOpt x,
          set = fn x => set "server-identity" GioSocketConnectableClass.tOpt x
        }
      val useSsl3Prop =
        {
          get = fn x => get "use-ssl3" boolean x,
          set = fn x => set "use-ssl3" boolean x
        }
      val validationFlagsProp =
        {
          get = fn x => get "validation-flags" GioTlsCertificateFlags.t x,
          set = fn x => set "validation-flags" GioTlsCertificateFlags.t x
        }
    end
  end
