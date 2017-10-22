structure GioInetAddressMaskClass :>
  GIO_INET_ADDRESS_MASK_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a inet_address_mask = unit
    type 'a class = 'a inet_address_mask class
  end
