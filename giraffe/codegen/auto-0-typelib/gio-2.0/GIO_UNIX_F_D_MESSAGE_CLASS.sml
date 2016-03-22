signature GIO_UNIX_F_D_MESSAGE_CLASS =
  sig
    type 'a unix_f_d_message
    type 'a socket_control_message_class
    include
      CLASS
        where type 'a class = 'a unix_f_d_message socket_control_message_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
