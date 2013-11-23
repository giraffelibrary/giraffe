structure GioTcpWrapperConnectionClass :>
  GIO_TCP_WRAPPER_CONNECTION_CLASS
    where type 'a tcpconnectionclass_t = 'a GioTcpConnectionClass.t
    where type C.notnull = GioTcpConnectionClass.C.notnull
    where type 'a C.p = 'a GioTcpConnectionClass.C.p =
  struct
    type 'a tcpwrapperconnection = unit
    type 'a tcpconnectionclass_t = 'a GioTcpConnectionClass.t
    type 'a t = 'a tcpwrapperconnection tcpconnectionclass_t
    fun toBase obj = obj
    val t = GioTcpConnectionClass.t
    val tOpt = GioTcpConnectionClass.tOpt
    structure C = GioTcpConnectionClass.C
  end
