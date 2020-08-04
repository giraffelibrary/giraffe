structure GioDtlsClientConnection :>
  GIO_DTLS_CLIENT_CONNECTION
    where type 'a class = 'a GioDtlsClientConnectionClass.class
    where type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dtls_client_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_dtls_client_connection_new")
          (
            GioDatagramBasedClass.PolyML.cPtr
             &&> GioSocketConnectableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDtlsClientConnectionClass.PolyML.cPtr
          )
      val getServerIdentity_ = call (getSymbol "g_dtls_client_connection_get_server_identity") (GioDtlsClientConnectionClass.PolyML.cPtr --> GioSocketConnectableClass.PolyML.cPtr)
      val getValidationFlags_ = call (getSymbol "g_dtls_client_connection_get_validation_flags") (GioDtlsClientConnectionClass.PolyML.cPtr --> GioTlsCertificateFlags.PolyML.cVal)
      val setServerIdentity_ = call (getSymbol "g_dtls_client_connection_set_server_identity") (GioDtlsClientConnectionClass.PolyML.cPtr &&> GioSocketConnectableClass.PolyML.cPtr --> cVoid)
      val setValidationFlags_ = call (getSymbol "g_dtls_client_connection_set_validation_flags") (GioDtlsClientConnectionClass.PolyML.cPtr &&> GioTlsCertificateFlags.PolyML.cVal --> cVoid)
    end
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
