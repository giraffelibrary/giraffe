structure GioTlsClientConnectionClass :>
  GIO_TLS_CLIENT_CONNECTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_client_connection = unit
    type 'a class = 'a tls_client_connection class
  end
