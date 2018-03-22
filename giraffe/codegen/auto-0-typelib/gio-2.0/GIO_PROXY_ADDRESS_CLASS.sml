signature GIO_PROXY_ADDRESS_CLASS =
  sig
    type 'a proxy_address
    type 'a inet_socket_address_class
    include
      CLASS
        where type 'a class = 'a proxy_address inet_socket_address_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
