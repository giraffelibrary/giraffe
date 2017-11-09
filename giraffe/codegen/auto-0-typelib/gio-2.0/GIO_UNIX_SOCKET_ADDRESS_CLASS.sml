signature GIO_UNIX_SOCKET_ADDRESS_CLASS =
  sig
    type 'a unix_socket_address
    type 'a socket_address_class
    include
      CLASS
        where type 'a class = 'a unix_socket_address socket_address_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
