signature GIO_SOCKET_CLASS =
  sig
    type 'a socket
    include
      CLASS
        where type 'a class = 'a socket GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
