structure GioTcpWrapperConnectionClass :>
  GIO_TCP_WRAPPER_CONNECTION_CLASS
    where type 'a tcp_connection_class = 'a GioTcpConnectionClass.class
    where type C.notnull = GioTcpConnectionClass.C.notnull
    where type 'a C.p = 'a GioTcpConnectionClass.C.p =
  struct
    type 'a tcp_connection_class = 'a GioTcpConnectionClass.class
    open GioTcpConnectionClass
    type 'a tcp_wrapper_connection = unit
    type 'a class = 'a tcp_wrapper_connection class
  end
