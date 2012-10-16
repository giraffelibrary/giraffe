structure GioThreadedSocketServiceClass :>
  GIO_THREADED_SOCKET_SERVICE_CLASS
    where type 'a socketserviceclass_t = 'a GioSocketServiceClass.t
    where type C.notnull = GioSocketServiceClass.C.notnull
    where type 'a C.p = 'a GioSocketServiceClass.C.p =
  struct
    type 'a threadedsocketservice = unit
    type 'a socketserviceclass_t = 'a GioSocketServiceClass.t
    type 'a t = 'a threadedsocketservice socketserviceclass_t
    fun toBase obj = obj
    val t = GioSocketServiceClass.t
    val tOpt = GioSocketServiceClass.tOpt
    structure C = GioSocketServiceClass.C
  end
