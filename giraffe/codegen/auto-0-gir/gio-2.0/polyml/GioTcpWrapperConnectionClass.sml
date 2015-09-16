structure GioTcpWrapperConnectionClass :>
  GIO_TCP_WRAPPER_CONNECTION_CLASS
    where type 'a tcp_connection_class_t = 'a GioTcpConnectionClass.t
    where type C.notnull = GioTcpConnectionClass.C.notnull
    where type 'a C.p = 'a GioTcpConnectionClass.C.p =
  struct
    type 'a tcp_wrapper_connection = unit
    type 'a tcp_connection_class_t = 'a GioTcpConnectionClass.t
    type 'a t = 'a tcp_wrapper_connection tcp_connection_class_t
    fun toBase obj = obj
    val t = GioTcpConnectionClass.t
    val tOpt = GioTcpConnectionClass.tOpt
    structure C = GioTcpConnectionClass.C
  end
