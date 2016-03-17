structure GioUnixSocketAddressClass :>
  GIO_UNIX_SOCKET_ADDRESS_CLASS
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type C.notnull = GioSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioSocketAddressClass.C.p =
  struct
    type 'a unix_socket_address = unit
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a class = 'a unix_socket_address socket_address_class
    type t = base class
    fun toBase obj = obj
    val t = GioSocketAddressClass.t
    val tOpt = GioSocketAddressClass.tOpt
    structure C = GioSocketAddressClass.C
  end
