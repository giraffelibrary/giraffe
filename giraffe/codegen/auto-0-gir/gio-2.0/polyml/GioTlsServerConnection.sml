structure GioTlsServerConnection :>
  GIO_TLS_SERVER_CONNECTION
    where type 'a class = 'a GioTlsServerConnectionClass.class
    where type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type tls_authentication_mode_t = GioTlsAuthenticationMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_server_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_tls_server_connection_new")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> GioTlsCertificateClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioTlsServerConnectionClass.class
    type 'a tls_certificate_class = 'a GioTlsCertificateClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type tls_authentication_mode_t = GioTlsAuthenticationMode.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIoStream certificate =
      (
        GioIOStreamClass.C.withPtr
         &&&> GioTlsCertificateClass.C.withOptPtr
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
