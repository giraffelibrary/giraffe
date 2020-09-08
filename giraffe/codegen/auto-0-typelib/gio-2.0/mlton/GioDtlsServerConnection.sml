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
              GioDatagramBasedClass.FFI.non_opt GioDatagramBasedClass.FFI.p
               * GioTlsCertificateClass.FFI.opt GioTlsCertificateClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDtlsServerConnectionClass.FFI.non_opt GioDtlsServerConnectionClass.FFI.p;
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
      open ValueAccessor
    in
      val authenticationModeProp =
        {
          name = "authentication-mode",
          gtype = fn () => C.gtype GioTlsAuthenticationMode.t (),
          get = fn x => fn () => C.get GioTlsAuthenticationMode.t x,
          set = fn x => C.set GioTlsAuthenticationMode.t x,
          init = fn x => C.set GioTlsAuthenticationMode.t x
        }
    end
  end
