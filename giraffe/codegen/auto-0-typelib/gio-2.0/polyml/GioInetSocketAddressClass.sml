structure GioInetSocketAddressClass :>
  GIO_INET_SOCKET_ADDRESS_CLASS
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type C.notnull = GioSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioSocketAddressClass.C.p =
  struct
    type 'a inet_socket_address = unit
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a class = 'a inet_socket_address socket_address_class
    type t = base class
    fun toBase obj = obj
    val t = GioSocketAddressClass.t
    val tOpt = GioSocketAddressClass.tOpt
    structure C = GioSocketAddressClass.C
  end
