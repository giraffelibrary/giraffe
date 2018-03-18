structure GioDtlsServerConnection :>
  GIO_DTLS_SERVER_CONNECTION
    where type 'a class = 'a GioDtlsServerConnectionClass.class
    where type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    where type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    where type tls_authentication_mode_t = GioTlsAuthenticationMode.t =
  struct
    val getType_ = _import "g_dtls_server_connection_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_server_connection_new" :
              GioDatagramBasedClass.FFI.notnull GioDatagramBasedClass.FFI.p
               * unit GioTlsCertificateClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDtlsServerConnectionClass.FFI.notnull GioDtlsServerConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDtlsServerConnectionClass.class
    type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    type 'a datagram_based_class = 'a GioDatagramBasedClass.class
    type tls_authentication_mode_t = GioTlsAuthenticationMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseSocket, certificate) =
      (
        GioDatagramBasedClass.FFI.withPtr
         &&&> GioTlsCertificateClass.FFI.withOptPtr
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
