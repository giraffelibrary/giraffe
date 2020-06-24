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
        GioDatagramBasedClass.FFI.withPtr
         &&&> GioSocketConnectableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDtlsClientConnectionClass.FFI.fromPtr true
      )
        new_
        (
          baseSocket
           & serverIdentity
           & []
        )
    fun getServerIdentity self = (GioDtlsClientConnectionClass.FFI.withPtr ---> GioSocketConnectableClass.FFI.fromPtr false) getServerIdentity_ self
    fun getValidationFlags self = (GioDtlsClientConnectionClass.FFI.withPtr ---> GioTlsCertificateFlags.FFI.fromVal) getValidationFlags_ self
    fun setServerIdentity self identity = (GioDtlsClientConnectionClass.FFI.withPtr &&&> GioSocketConnectableClass.FFI.withPtr ---> I) setServerIdentity_ (self & identity)
    fun setValidationFlags self flags = (GioDtlsClientConnectionClass.FFI.withPtr &&&> GioTlsCertificateFlags.FFI.withVal ---> I) setValidationFlags_ (self & flags)
    local
      open Property
    in
      val serverIdentityProp =
        {
          get = fn x => get "server-identity" GioSocketConnectableClass.tOpt x,
          set = fn x => set "server-identity" GioSocketConnectableClass.tOpt x,
          new = fn x => new "server-identity" GioSocketConnectableClass.tOpt x
        }
      val validationFlagsProp =
        {
          get = fn x => get "validation-flags" GioTlsCertificateFlags.t x,
          set = fn x => set "validation-flags" GioTlsCertificateFlags.t x,
          new = fn x => new "validation-flags" GioTlsCertificateFlags.t x
        }
    end
  end
