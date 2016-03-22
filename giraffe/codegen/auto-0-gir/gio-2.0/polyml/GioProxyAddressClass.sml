structure GioProxyAddressClass :>
  GIO_PROXY_ADDRESS_CLASS
    where type 'a inet_socket_address_class = 'a GioInetSocketAddressClass.class
    where type C.notnull = GioInetSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioInetSocketAddressClass.C.p =
  struct
    type 'a inet_socket_address_class = 'a GioInetSocketAddressClass.class
    open GioInetSocketAddressClass
    type 'a proxy_address = unit
    type 'a class = 'a proxy_address class
  end
