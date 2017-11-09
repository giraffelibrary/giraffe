signature GIO_TCP_CONNECTION_CLASS =
  sig
    type 'a tcp_connection
    type 'a socket_connection_class
    include
      CLASS
        where type 'a class = 'a tcp_connection socket_connection_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
