structure GioTlsServerConnectionClass :>
  GIO_TLS_SERVER_CONNECTION_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_server_connection = unit
    type 'a class = 'a tls_server_connection class
  end
