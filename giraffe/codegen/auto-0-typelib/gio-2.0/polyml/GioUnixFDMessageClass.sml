structure GioUnixFDMessageClass :>
  GIO_UNIX_F_D_MESSAGE_CLASS
    where type 'a socket_control_message_class_t = 'a GioSocketControlMessageClass.t
    where type C.notnull = GioSocketControlMessageClass.C.notnull
    where type 'a C.p = 'a GioSocketControlMessageClass.C.p =
  struct
    type 'a unix_f_d_message = unit
    type 'a socket_control_message_class_t = 'a GioSocketControlMessageClass.t
    type 'a t = 'a unix_f_d_message socket_control_message_class_t
    fun toBase obj = obj
    val t = GioSocketControlMessageClass.t
    val tOpt = GioSocketControlMessageClass.tOpt
    structure C = GioSocketControlMessageClass.C
  end
