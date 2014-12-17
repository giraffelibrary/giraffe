structure GioTlsServerConnection :>
  GIO_TLS_SERVER_CONNECTION
    where type 'a class_t = 'a GioTlsServerConnectionClass.t
    where type 'a tlscertificateclass_t = 'a GioTlsCertificateClass.t
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t
    where type tlsauthenticationmode_t = GioTlsAuthenticationMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_server_connection_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgio "g_tls_server_connection_new")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a GioTlsServerConnectionClass.t
    type 'a tlscertificateclass_t = 'a GioTlsCertificateClass.t
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
    type tlsauthenticationmode_t = GioTlsAuthenticationMode.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIoStream certificate =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
