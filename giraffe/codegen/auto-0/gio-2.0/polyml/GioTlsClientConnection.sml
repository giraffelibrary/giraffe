structure GioTlsClientConnection :>
  GIO_TLS_CLIENT_CONNECTION
    where type 'a class_t = 'a GioTlsClientConnectionClass.t
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    where type tlscertificateflags_t = GioTlsCertificateFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_client_connection_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgio "g_tls_client_connection_new")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getServerIdentity_ = call (load_sym libgio "g_tls_client_connection_get_server_identity") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getUseSsl3_ = call (load_sym libgio "g_tls_client_connection_get_use_ssl3") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getValidationFlags_ = call (load_sym libgio "g_tls_client_connection_get_validation_flags") (GObjectObjectClass.PolyML.PTR --> GioTlsCertificateFlags.PolyML.VAL)
      val setServerIdentity_ = call (load_sym libgio "g_tls_client_connection_set_server_identity") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setUseSsl3_ = call (load_sym libgio "g_tls_client_connection_set_use_ssl3") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setValidationFlags_ = call (load_sym libgio "g_tls_client_connection_set_validation_flags") (GObjectObjectClass.PolyML.PTR &&> GioTlsCertificateFlags.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioTlsClientConnectionClass.t
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    type tlscertificateflags_t = GioTlsCertificateFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIoStream serverIdentity =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
