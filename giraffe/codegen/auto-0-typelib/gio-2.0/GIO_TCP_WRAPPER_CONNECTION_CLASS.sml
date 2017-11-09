signature GIO_TCP_WRAPPER_CONNECTION_CLASS =
  sig
    type 'a tcp_wrapper_connection
    type 'a tcp_connection_class
    include
      CLASS
        where type 'a class = 'a tcp_wrapper_connection tcp_connection_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
