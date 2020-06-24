structure GioTlsBackend :>
  GIO_TLS_BACKEND
    where type 'a class = 'a GioTlsBackendClass.class
    where type 'a tls_database_class = 'a GioTlsDatabaseClass.class =
  struct
    val getType_ = _import "g_tls_backend_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "g_tls_backend_get_default" : unit -> GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p;
    val getCertificateType_ = _import "g_tls_backend_get_certificate_type" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GObjectType.FFI.val_;
    val getClientConnectionType_ = _import "g_tls_backend_get_client_connection_type" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GObjectType.FFI.val_;
    val getDefaultDatabase_ = _import "g_tls_backend_get_default_database" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GioTlsDatabaseClass.FFI.non_opt GioTlsDatabaseClass.FFI.p;
    val getDtlsClientConnectionType_ = _import "g_tls_backend_get_dtls_client_connection_type" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GObjectType.FFI.val_;
    val getDtlsServerConnectionType_ = _import "g_tls_backend_get_dtls_server_connection_type" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GObjectType.FFI.val_;
    val getFileDatabaseType_ = _import "g_tls_backend_get_file_database_type" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GObjectType.FFI.val_;
    val getServerConnectionType_ = _import "g_tls_backend_get_server_connection_type" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GObjectType.FFI.val_;
    val supportsDtls_ = _import "g_tls_backend_supports_dtls" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GBool.FFI.val_;
    val supportsTls_ = _import "g_tls_backend_supports_tls" : GioTlsBackendClass.FFI.non_opt GioTlsBackendClass.FFI.p -> GBool.FFI.val_;
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
