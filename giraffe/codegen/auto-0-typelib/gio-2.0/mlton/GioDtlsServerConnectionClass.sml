structure GioDtlsServerConnectionClass :>
  GIO_DTLS_SERVER_CONNECTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a dtls_server_connection = unit
    type 'a class = 'a dtls_server_connection class
  end