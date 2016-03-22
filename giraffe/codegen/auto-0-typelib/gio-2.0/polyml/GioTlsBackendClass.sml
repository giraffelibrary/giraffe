structure GioTlsBackendClass :>
  GIO_TLS_BACKEND_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_backend = unit
    type 'a class = 'a tls_backend class
  end
