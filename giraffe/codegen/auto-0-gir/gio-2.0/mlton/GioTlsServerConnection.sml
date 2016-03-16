structure GioTlsServerConnection :>
  GIO_TLS_SERVER_CONNECTION
    where type 'a class_t = 'a GioTlsServerConnectionClass.t
    where type 'a tls_certificate_class_t = 'a GioTlsCertificateClass.t
    where type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    where type tls_authentication_mode_t = GioTlsAuthenticationMode.t =
  struct
    val getType_ = _import "g_tls_server_connection_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_server_connection_new" :
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
    type 'a class_t = 'a GioTlsServerConnectionClass.t
    type 'a tls_certificate_class_t = 'a GioTlsCertificateClass.t
    type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    type tls_authentication_mode_t = GioTlsAuthenticationMode.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIoStream certificate =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
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
