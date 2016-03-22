structure GioSocketControlMessageClass :>
  GIO_SOCKET_CONTROL_MESSAGE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a socket_control_message = unit
    type 'a class = 'a socket_control_message class
  end
