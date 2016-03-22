structure GioSocketAddressEnumeratorClass :>
  GIO_SOCKET_ADDRESS_ENUMERATOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a socket_address_enumerator = unit
    type 'a class = 'a socket_address_enumerator class
  end
