signature GIO_UNIX_F_D_MESSAGE_CLASS =
  sig
    type 'a unix_f_d_message
    type 'a socket_control_message_class
    type 'a class = 'a unix_f_d_message socket_control_message_class
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
