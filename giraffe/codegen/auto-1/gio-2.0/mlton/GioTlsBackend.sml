structure GioTlsBackend :>
  GIO_TLS_BACKEND
    where type 'a class_t = 'a GioTlsBackendClass.t
    where type 'a tlsdatabaseclass_t = 'a GioTlsDatabaseClass.t =
  struct
    val getType_ = _import "g_tls_backend_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "g_tls_backend_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDefaultDatabase_ = _import "g_tls_backend_get_default_database" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val supportsTls_ = _import "g_tls_backend_supports_tls" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    type 'a class_t = 'a GioTlsBackendClass.t
    type 'a tlsdatabaseclass_t = 'a GioTlsDatabaseClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioTlsBackendClass.C.fromPtr false) getDefault_ ()
    fun getDefaultDatabase self = (GObjectObjectClass.C.withPtr ---> GioTlsDatabaseClass.C.fromPtr true) getDefaultDatabase_ self
    fun supportsTls self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) supportsTls_ self
  end
