structure GioTcpConnectionClass :>
  GIO_TCP_CONNECTION_CLASS
    where type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    where type C.notnull = GioSocketConnectionClass.C.notnull
    where type 'a C.p = 'a GioSocketConnectionClass.C.p =
  struct
    type 'a socket_connection_class = 'a GioSocketConnectionClass.class
    open GioSocketConnectionClass
    type 'a tcp_connection = unit
    type 'a class = 'a tcp_connection class
  end
