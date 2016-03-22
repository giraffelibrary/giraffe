structure GioNetworkServiceClass :>
  GIO_NETWORK_SERVICE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a network_service = unit
    type 'a class = 'a network_service class
  end
