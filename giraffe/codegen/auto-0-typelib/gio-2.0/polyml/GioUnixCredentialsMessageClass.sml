structure GioUnixCredentialsMessageClass :>
  GIO_UNIX_CREDENTIALS_MESSAGE_CLASS
    where type 'a socket_control_message_class = 'a GioSocketControlMessageClass.class
    where type C.notnull = GioSocketControlMessageClass.C.notnull
    where type 'a C.p = 'a GioSocketControlMessageClass.C.p =
  struct
    type 'a socket_control_message_class = 'a GioSocketControlMessageClass.class
    open GioSocketControlMessageClass
    type 'a unix_credentials_message = unit
    type 'a class = 'a unix_credentials_message class
  end
