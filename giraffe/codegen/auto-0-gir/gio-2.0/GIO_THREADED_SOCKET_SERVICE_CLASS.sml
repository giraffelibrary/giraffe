signature GIO_THREADED_SOCKET_SERVICE_CLASS =
  sig
    type 'a threaded_socket_service
    type 'a socket_service_class
    type 'a class = 'a threaded_socket_service socket_service_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
