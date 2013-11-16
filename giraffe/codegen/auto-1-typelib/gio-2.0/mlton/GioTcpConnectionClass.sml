structure GioTcpConnectionClass :>
  GIO_TCP_CONNECTION_CLASS
    where type 'a socketconnectionclass_t = 'a GioSocketConnectionClass.t
    where type C.notnull = GioSocketConnectionClass.C.notnull
    where type 'a C.p = 'a GioSocketConnectionClass.C.p =
  struct
    type 'a tcpconnection = unit
    type 'a socketconnectionclass_t = 'a GioSocketConnectionClass.t
    type 'a t = 'a tcpconnection socketconnectionclass_t
    fun toBase obj = obj
    val t = GioSocketConnectionClass.t
    val tOpt = GioSocketConnectionClass.tOpt
    structure C = GioSocketConnectionClass.C
  end
