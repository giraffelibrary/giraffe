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
      val getDefaultDatabase_ = call (getSymbol "g_tls_backend_get_default_database") (GioTlsBackendClass.PolyML.cPtr --> GioTlsDatabaseClass.PolyML.cPtr)
      val supportsTls_ = call (getSymbol "g_tls_backend_supports_tls") (GioTlsBackendClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioTlsBackendClass.class
    type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioTlsBackendClass.FFI.fromPtr false) getDefault_ ()
    fun getDefaultDatabase self = (GioTlsBackendClass.FFI.withPtr ---> GioTlsDatabaseClass.FFI.fromPtr true) getDefaultDatabase_ self
    fun supportsTls self = (GioTlsBackendClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsTls_ self
  end
