structure GioUnixConnectionClass :>
  GIO_UNIX_CONNECTION_CLASS
    where type 'a socketconnectionclass_t = 'a GioSocketConnectionClass.t
    where type C.notnull = GioSocketConnectionClass.C.notnull
    where type 'a C.p = 'a GioSocketConnectionClass.C.p =
  struct
    type 'a unixconnection = unit
    type 'a socketconnectionclass_t = 'a GioSocketConnectionClass.t
    type 'a t = 'a unixconnection socketconnectionclass_t
    fun toBase obj = obj
    val t = GioSocketConnectionClass.t
    val tOpt = GioSocketConnectionClass.tOpt
    structure C = GioSocketConnectionClass.C
  end
