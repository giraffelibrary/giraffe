structure GioTlsBackend :>
  GIO_TLS_BACKEND
    where type 'a class = 'a GioTlsBackendClass.class
    where type 'a tls_database_class = 'a GioTlsDatabaseClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_backend_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libgio "g_tls_backend_get_default") (FFI.PolyML.cVoid --> GioTlsBackendClass.PolyML.cPtr)
      val getDefaultDatabase_ = call (load_sym libgio "g_tls_backend_get_default_database") (GioTlsBackendClass.PolyML.cPtr --> GioTlsDatabaseClass.PolyML.cPtr)
      val supportsTls_ = call (load_sym libgio "g_tls_backend_supports_tls") (GioTlsBackendClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioTlsBackendClass.class
    type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioTlsBackendClass.C.fromPtr false) getDefault_ ()
    fun getDefaultDatabase self = (GioTlsBackendClass.C.withPtr ---> GioTlsDatabaseClass.C.fromPtr true) getDefaultDatabase_ self
    fun supportsTls self = (GioTlsBackendClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsTls_ self
  end
