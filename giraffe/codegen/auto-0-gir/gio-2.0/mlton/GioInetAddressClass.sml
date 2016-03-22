structure GioInetAddressClass :>
  GIO_INET_ADDRESS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a inet_address = unit
    type 'a class = 'a inet_address class
  end
