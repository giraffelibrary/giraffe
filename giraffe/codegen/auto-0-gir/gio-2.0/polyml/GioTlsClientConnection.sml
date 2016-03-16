structure GioTlsClientConnection :>
  GIO_TLS_CLIENT_CONNECTION
    where type 'a class_t = 'a GioTlsClientConnectionClass.t
    where type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    where type tls_certificate_flags_t = GioTlsCertificateFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_client_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgio "g_tls_client_connection_new")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getServerIdentity_ = call (load_sym libgio "g_tls_client_connection_get_server_identity") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getUseSsl3_ = call (load_sym libgio "g_tls_client_connection_get_use_ssl3") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getValidationFlags_ = call (load_sym libgio "g_tls_client_connection_get_validation_flags") (GObjectObjectClass.PolyML.cPtr --> GioTlsCertificateFlags.PolyML.cVal)
      val setServerIdentity_ = call (load_sym libgio "g_tls_client_connection_set_server_identity") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setUseSsl3_ = call (load_sym libgio "g_tls_client_connection_set_use_ssl3") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setValidationFlags_ = call (load_sym libgio "g_tls_client_connection_set_validation_flags") (GObjectObjectClass.PolyML.cPtr &&> GioTlsCertificateFlags.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioTlsClientConnectionClass.t
    type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type tls_certificate_flags_t = GioTlsCertificateFlags.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIoStream serverIdentity =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        new_
        (
          baseIoStream
           & serverIdentity
           & []
        )
    fun getServerIdentity self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) getServerIdentity_ self
    fun getUseSsl3 self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseSsl3_ self
    fun getValidationFlags self = (GObjectObjectClass.C.withPtr ---> GioTlsCertificateFlags.C.fromVal) getValidationFlags_ self
    fun setServerIdentity self identity = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setServerIdentity_ (self & identity)
    fun setUseSsl3 self useSsl3 = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseSsl3_ (self & useSsl3)
    fun setValidationFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioTlsCertificateFlags.C.withVal ---> I) setValidationFlags_ (self & flags)
    local
      open Property
    in
      val serverIdentityProp =
        {
          get = fn x => get "server-identity" GioSocketConnectableClass.tOpt x,
          set = fn x => set "server-identity" GioSocketConnectableClass.tOpt x
        }
      val useSsl3Prop =
        {
          get = fn x => get "use-ssl3" boolean x,
          set = fn x => set "use-ssl3" boolean x
        }
      val validationFlagsProp =
        {
          get = fn x => get "validation-flags" GioTlsCertificateFlags.t x,
          set = fn x => set "validation-flags" GioTlsCertificateFlags.t x
        }
    end
  end
