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
              GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p
               * unit GioTlsCertificateClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p;
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
        GioIOStreamClass.FFI.withPtr
         &&&> GioTlsCertificateClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.FFI.fromPtr true
      )
        new_
        (
          baseIoStream
           & certificate
           & []
        )
    local
      open Property
    in
      val authenticationModeProp =
        {
          get = fn x => get "authentication-mode" GioTlsAuthenticationMode.t x,
          set = fn x => set "authentication-mode" GioTlsAuthenticationMode.t x
        }
    end
  end
