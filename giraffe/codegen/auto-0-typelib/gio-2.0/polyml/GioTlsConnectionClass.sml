structure GioTlsConnectionClass :>
  GIO_TLS_CONNECTION_CLASS
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type C.notnull = GioIOStreamClass.C.notnull
    where type 'a C.p = 'a GioIOStreamClass.C.p =
  struct
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    open GioIOStreamClass
    type 'a tls_connection = unit
    type 'a class = 'a tls_connection class
  end
