signature GIO_SOCKET_CONTROL_MESSAGE_CLASS =
  sig
    type 'a socket_control_message
    include
      CLASS
        where type 'a class = 'a socket_control_message GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
