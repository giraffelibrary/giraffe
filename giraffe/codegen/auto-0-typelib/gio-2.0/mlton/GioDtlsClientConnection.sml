structure GioDtlsClientConnection :>
  GIO_DTLS_CLIENT_CONNECTION
    where type 'a class = 'a GioDtlsClientConnectionClass.class
    where type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t =
  struct
    val getType_ = _import "g_dtls_client_connection_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_client_connection_new" :
              GioDatagramBasedClass.FFI.non_opt GioDatagramBasedClass.FFI.p
               * GioSocketConnectableClass.FFI.opt GioSocketConnectableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDtlsClientConnectionClass.FFI.non_opt GioDtlsClientConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getServerIdentity_ = _import "g_dtls_client_connection_get_server_identity" : GioDtlsClientConnectionClass.FFI.non_opt GioDtlsClientConnectionClass.FFI.p -> GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p;
    val getValidationFlags_ = _import "g_dtls_client_connection_get_validation_flags" : GioDtlsClientConnectionClass.FFI.non_opt GioDtlsClientConnectionClass.FFI.p -> GioTlsCertificateFlags.FFI.val_;
    val setServerIdentity_ = fn x1 & x2 => (_import "g_dtls_client_connection_set_server_identity" : GioDtlsClientConnectionClass.FFI.non_opt GioDtlsClientConnectionClass.FFI.p * GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p -> unit;) (x1, x2)
    val setValidationFlags_ = fn x1 & x2 => (_import "g_dtls_client_connection_set_validation_flags" : GioDtlsClientConnectionClass.FFI.non_opt GioDtlsClientConnectionClass.FFI.p * GioTlsCertificateFlags.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioDtlsClientConnectionClass.class
    type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseSocket, serverIdentity) =
      (
        GioDatagramBasedClass.FFI.withPtr false
         &&&> GioSocketConnectableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioDtlsClientConnectionClass.FFI.fromPtr true
      )
        new_
        (
          baseSocket
           & serverIdentity
           & []
        )
    fun getServerIdentity self = (GioDtlsClientConnectionClass.FFI.withPtr false ---> GioSocketConnectableClass.FFI.fromPtr false) getServerIdentity_ self
    fun getValidationFlags self = (GioDtlsClientConnectionClass.FFI.withPtr false ---> GioTlsCertificateFlags.FFI.fromVal) getValidationFlags_ self
    fun setServerIdentity self identity = (GioDtlsClientConnectionClass.FFI.withPtr false &&&> GioSocketConnectableClass.FFI.withPtr false ---> I) setServerIdentity_ (self & identity)
    fun setValidationFlags self flags = (GioDtlsClientConnectionClass.FFI.withPtr false &&&> GioTlsCertificateFlags.FFI.withVal ---> I) setValidationFlags_ (self & flags)
    local
      open ValueAccessor
    in
      val serverIdentityProp =
        {
          name = "server-identity",
          gtype = fn () => C.gtype GioSocketConnectableClass.tOpt (),
          get = fn x => fn () => C.get GioSocketConnectableClass.tOpt x,
          set = fn x => C.set GioSocketConnectableClass.tOpt x,
          init = fn x => C.set GioSocketConnectableClass.tOpt x
        }
      val validationFlagsProp =
        {
          name = "validation-flags",
          gtype = fn () => C.gtype GioTlsCertificateFlags.t (),
          get = fn x => fn () => C.get GioTlsCertificateFlags.t x,
          set = fn x => C.set GioTlsCertificateFlags.t x,
          init = fn x => C.set GioTlsCertificateFlags.t x
        }
    end
  end
