structure GioProxyAddressEnumeratorClass :>
  GIO_PROXY_ADDRESS_ENUMERATOR_CLASS
    where type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    where type C.notnull = GioSocketAddressEnumeratorClass.C.notnull
    where type 'a C.p = 'a GioSocketAddressEnumeratorClass.C.p =
  struct
    type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    open GioSocketAddressEnumeratorClass
    type 'a proxy_address_enumerator = unit
    type 'a class = 'a proxy_address_enumerator class
  end
