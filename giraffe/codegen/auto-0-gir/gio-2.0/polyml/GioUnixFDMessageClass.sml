structure GioUnixFDMessageClass :>
  GIO_UNIX_F_D_MESSAGE_CLASS
    where type 'a socket_control_message_class = 'a GioSocketControlMessageClass.class
    where type C.notnull = GioSocketControlMessageClass.C.notnull
    where type 'a C.p = 'a GioSocketControlMessageClass.C.p =
  struct
    type 'a socket_control_message_class = 'a GioSocketControlMessageClass.class
    open GioSocketControlMessageClass
    type 'a unix_f_d_message = unit
    type 'a class = 'a unix_f_d_message class
  end
