structure GioTlsBackend :>
  GIO_TLS_BACKEND
    where type 'a class_t = 'a GioTlsBackendClass.t
    where type 'a tlsdatabaseclass_t = 'a GioTlsDatabaseClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_backend_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libgio "g_tls_backend_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDefaultDatabase_ = call (load_sym libgio "g_tls_backend_get_default_database") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val supportsTls_ = call (load_sym libgio "g_tls_backend_supports_tls") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioTlsBackendClass.t
    type 'a tlsdatabaseclass_t = 'a GioTlsDatabaseClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioTlsBackendClass.C.fromPtr false) getDefault_ ()
    fun getDefaultDatabase self = (GObjectObjectClass.C.withPtr ---> GioTlsDatabaseClass.C.fromPtr true) getDefaultDatabase_ self
    fun supportsTls self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsTls_ self
  end
