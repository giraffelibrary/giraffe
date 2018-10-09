signature GIO_INET_SOCKET_ADDRESS_CLASS =
  sig
    type 'a inet_socket_address
    type 'a socket_address_class
    include
      CLASS
        where type 'a class = 'a inet_socket_address socket_address_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
