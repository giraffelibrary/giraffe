structure GioDatagramBasedClass :>
  GIO_DATAGRAM_BASED_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a datagram_based = unit
    type 'a class = 'a datagram_based class
  end
