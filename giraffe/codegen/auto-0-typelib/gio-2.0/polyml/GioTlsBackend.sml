structure GioTlsBackend :>
  GIO_TLS_BACKEND
    where type 'a class = 'a GioTlsBackendClass.class
    where type 'a tls_database_class = 'a GioTlsDatabaseClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_backend_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "g_tls_backend_get_default") (cVoid --> GioTlsBackendClass.PolyML.cPtr)
      val getCertificateType_ = call (getSymbol "g_tls_backend_get_certificate_type") (GioTlsBackendClass.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val getClientConnectionType_ = call (getSymbol "g_tls_backend_get_client_connection_type") (GioTlsBackendClass.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val getDefaultDatabase_ = call (getSymbol "g_tls_backend_get_default_database") (GioTlsBackendClass.PolyML.cPtr --> GioTlsDatabaseClass.PolyML.cPtr)
      val getDtlsClientConnectionType_ = call (getSymbol "g_tls_backend_get_dtls_client_connection_type") (GioTlsBackendClass.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val getDtlsServerConnectionType_ = call (getSymbol "g_tls_backend_get_dtls_server_connection_type") (GioTlsBackendClass.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val getFileDatabaseType_ = call (getSymbol "g_tls_backend_get_file_database_type") (GioTlsBackendClass.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val getServerConnectionType_ = call (getSymbol "g_tls_backend_get_server_connection_type") (GioTlsBackendClass.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val supportsDtls_ = call (getSymbol "g_tls_backend_supports_dtls") (GioTlsBackendClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsTls_ = call (getSymbol "g_tls_backend_supports_tls") (GioTlsBackendClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioTlsBackendClass.class
    type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioTlsBackendClass.FFI.fromPtr false) getDefault_ ()
    fun getCertificateType self = (GioTlsBackendClass.FFI.withPtr ---> GObjectType.FFI.fromVal) getCertificateType_ self
    fun getClientConnectionType self = (GioTlsBackendClass.FFI.withPtr ---> GObjectType.FFI.fromVal) getClientConnectionType_ self
    fun getDefaultDatabase self = (GioTlsBackendClass.FFI.withPtr ---> GioTlsDatabaseClass.FFI.fromPtr true) getDefaultDatabase_ self
    fun getDtlsClientConnectionType self = (GioTlsBackendClass.FFI.withPtr ---> GObjectType.FFI.fromVal) getDtlsClientConnectionType_ self
    fun getDtlsServerConnectionType self = (GioTlsBackendClass.FFI.withPtr ---> GObjectType.FFI.fromVal) getDtlsServerConnectionType_ self
    fun getFileDatabaseType self = (GioTlsBackendClass.FFI.withPtr ---> GObjectType.FFI.fromVal) getFileDatabaseType_ self
    fun getServerConnectionType self = (GioTlsBackendClass.FFI.withPtr ---> GObjectType.FFI.fromVal) getServerConnectionType_ self
    fun supportsDtls self = (GioTlsBackendClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsDtls_ self
    fun supportsTls self = (GioTlsBackendClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsTls_ self
  end
