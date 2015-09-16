structure GioSocketServiceClass :>
  GIO_SOCKET_SERVICE_CLASS
    where type 'a socket_listener_class_t = 'a GioSocketListenerClass.t
    where type C.notnull = GioSocketListenerClass.C.notnull
    where type 'a C.p = 'a GioSocketListenerClass.C.p =
  struct
    type 'a socket_service = unit
    type 'a socket_listener_class_t = 'a GioSocketListenerClass.t
    type 'a t = 'a socket_service socket_listener_class_t
    fun toBase obj = obj
    val t = GioSocketListenerClass.t
    val tOpt = GioSocketListenerClass.tOpt
    structure C = GioSocketListenerClass.C
  end
