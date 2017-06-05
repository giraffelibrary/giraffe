structure GioTlsBackend :>
  GIO_TLS_BACKEND
    where type 'a class = 'a GioTlsBackendClass.class
    where type 'a tls_database_class = 'a GioTlsDatabaseClass.class =
  struct
    val getType_ = _import "g_tls_backend_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "g_tls_backend_get_default" : unit -> GioTlsBackendClass.FFI.notnull GioTlsBackendClass.FFI.p;
    val getDefaultDatabase_ = _import "g_tls_backend_get_default_database" : GioTlsBackendClass.FFI.notnull GioTlsBackendClass.FFI.p -> GioTlsDatabaseClass.FFI.notnull GioTlsDatabaseClass.FFI.p;
    val supportsTls_ = _import "g_tls_backend_supports_tls" : GioTlsBackendClass.FFI.notnull GioTlsBackendClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioTlsBackendClass.class
    type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GioTlsBackendClass.FFI.fromPtr false) getDefault_ ()
    fun getDefaultDatabase self = (GioTlsBackendClass.FFI.withPtr ---> GioTlsDatabaseClass.FFI.fromPtr true) getDefaultDatabase_ self
    fun supportsTls self = (GioTlsBackendClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsTls_ self
  end
