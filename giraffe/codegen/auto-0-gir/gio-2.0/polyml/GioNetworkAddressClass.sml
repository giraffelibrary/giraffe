structure GioNetworkAddressClass :>
  GIO_NETWORK_ADDRESS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a network_address = unit
    type 'a class = 'a network_address class
  end
