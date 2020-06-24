structure GioTlsBackendClass :>
  GIO_TLS_BACKEND_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_backend = unit
    type 'a class = 'a tls_backend class
  end
