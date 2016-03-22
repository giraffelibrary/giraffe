structure GioTlsBackend :>
  GIO_TLS_BACKEND
    where type 'a class = 'a GioTlsBackendClass.class
    where type 'a tls_database_class = 'a GioTlsDatabaseClass.class =
  struct
    val getType_ = _import "g_tls_backend_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "g_tls_backend_get_default" : unit -> GioTlsBackendClass.C.notnull GioTlsBackendClass.C.p;
    val getDefaultDatabase_ = _import "g_tls_backend_get_default_database" : GioTlsBackendClass.C.notnull GioTlsBackendClass.C.p -> GioTlsDatabaseClass.C.notnull GioTlsDatabaseClass.C.p;
    val supportsTls_ = _import "g_tls_backend_supports_tls" : GioTlsBackendClass.C.notnull GioTlsBackendClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GioTlsBackendClass.class
    type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioTlsBackendClass.C.fromPtr false) getDefault_ ()
    fun getDefaultDatabase self = (GioTlsBackendClass.C.withPtr ---> GioTlsDatabaseClass.C.fromPtr true) getDefaultDatabase_ self
    fun supportsTls self = (GioTlsBackendClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsTls_ self
  end
