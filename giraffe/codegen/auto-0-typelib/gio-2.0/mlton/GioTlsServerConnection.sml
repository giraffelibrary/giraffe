structure GioTlsServerConnection :>
  GIO_TLS_SERVER_CONNECTION
    where type 'a class = 'a GioTlsServerConnectionClass.class
    where type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type tls_authentication_mode_t = GioTlsAuthenticationMode.t =
  struct
    val getType_ = _import "g_tls_server_connection_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_server_connection_new" :
              GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p
               * GioTlsCertificateClass.FFI.opt GioTlsCertificateClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsServerConnectionClass.FFI.non_opt GioTlsServerConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioTlsServerConnectionClass.class
    type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type tls_authentication_mode_t = GioTlsAuthenticationMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseIoStream, certificate) =
      (
        GioIOStreamClass.FFI.withPtr false
         &&&> GioTlsCertificateClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioTlsServerConnectionClass.FFI.fromPtr true
      )
        new_
        (
          baseIoStream
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
