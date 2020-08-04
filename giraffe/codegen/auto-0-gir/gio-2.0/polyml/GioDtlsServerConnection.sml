structure GioDtlsServerConnection :>
  GIO_DTLS_SERVER_CONNECTION
    where type 'a class = 'a GioDtlsServerConnectionClass.class
    where type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    where type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    where type tls_authentication_mode_t = GioTlsAuthenticationMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dtls_server_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_dtls_server_connection_new")
          (
            GioDatagramBasedClass.PolyML.cPtr
             &&> GioTlsCertificateClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDtlsServerConnectionClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioDtlsServerConnectionClass.class
    type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    type tls_authentication_mode_t = GioTlsAuthenticationMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseSocket, certificate) =
      (
        GioDatagramBasedClass.FFI.withPtr false
         &&&> GioTlsCertificateClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioDtlsServerConnectionClass.FFI.fromPtr true
      )
        new_
        (
          baseSocket
           & certificate
           & []
        )
    local
      open Property
    in
      val authenticationModeProp =
        {
          get = fn x => get "authentication-mode" GioTlsAuthenticationMode.t x,
          set = fn x => set "authentication-mode" GioTlsAuthenticationMode.t x,
          new = fn x => new "authentication-mode" GioTlsAuthenticationMode.t x
        }
    end
  end
