structure GioTcpWrapperConnectionClass :>
  GIO_TCP_WRAPPER_CONNECTION_CLASS
    where type 'a tcp_connection_class = 'a GioTcpConnectionClass.class
    where type C.notnull = GioTcpConnectionClass.C.notnull
    where type 'a C.p = 'a GioTcpConnectionClass.C.p =
  struct
    type 'a tcp_wrapper_connection = unit
    type 'a tcp_connection_class = 'a GioTcpConnectionClass.class
    type 'a class = 'a tcp_wrapper_connection tcp_connection_class
    type t = base class
    fun toBase obj = obj
    val t = GioTcpConnectionClass.t
    val tOpt = GioTcpConnectionClass.tOpt
    structure C = GioTcpConnectionClass.C
  end
