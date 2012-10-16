structure GioSocketServiceClass :>
  GIO_SOCKET_SERVICE_CLASS
    where type 'a socketlistenerclass_t = 'a GioSocketListenerClass.t
    where type C.notnull = GioSocketListenerClass.C.notnull
    where type 'a C.p = 'a GioSocketListenerClass.C.p =
  struct
    type 'a socketservice = unit
    type 'a socketlistenerclass_t = 'a GioSocketListenerClass.t
    type 'a t = 'a socketservice socketlistenerclass_t
    fun toBase obj = obj
    val t = GioSocketListenerClass.t
    val tOpt = GioSocketListenerClass.tOpt
    structure C = GioSocketListenerClass.C
  end
