structure GioInetSocketAddressClass :>
  GIO_INET_SOCKET_ADDRESS_CLASS
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type C.notnull = GioSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioSocketAddressClass.C.p =
  struct
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    open GioSocketAddressClass
    type 'a inet_socket_address = unit
    type 'a class = 'a inet_socket_address class
  end
