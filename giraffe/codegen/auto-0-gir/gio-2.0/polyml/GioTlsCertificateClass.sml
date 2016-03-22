structure GioTlsCertificateClass :>
  GIO_TLS_CERTIFICATE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_certificate = unit
    type 'a class = 'a tls_certificate class
  end
