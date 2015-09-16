structure GioThreadedSocketServiceClass :>
  GIO_THREADED_SOCKET_SERVICE_CLASS
    where type 'a socket_service_class_t = 'a GioSocketServiceClass.t
    where type C.notnull = GioSocketServiceClass.C.notnull
    where type 'a C.p = 'a GioSocketServiceClass.C.p =
  struct
    type 'a threaded_socket_service = unit
    type 'a socket_service_class_t = 'a GioSocketServiceClass.t
    type 'a t = 'a threaded_socket_service socket_service_class_t
    fun toBase obj = obj
    val t = GioSocketServiceClass.t
    val tOpt = GioSocketServiceClass.tOpt
    structure C = GioSocketServiceClass.C
  end
