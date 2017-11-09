signature GTK_SOCKET_CLASS =
  sig
    type 'a socket
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a socket container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
