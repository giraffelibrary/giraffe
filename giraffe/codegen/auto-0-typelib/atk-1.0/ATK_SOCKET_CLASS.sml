signature ATK_SOCKET_CLASS =
  sig
    type 'a socket
    type 'a object_class
    include
      CLASS
        where type 'a class = 'a socket object_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
