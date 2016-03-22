structure GioTlsPasswordClass :>
  GIO_TLS_PASSWORD_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_password = unit
    type 'a class = 'a tls_password class
  end
