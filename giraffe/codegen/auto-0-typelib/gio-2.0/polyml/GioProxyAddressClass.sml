structure GioProxyAddressClass :>
  GIO_PROXY_ADDRESS_CLASS
    where type 'a inet_socket_address_class = 'a GioInetSocketAddressClass.class
    where type C.notnull = GioInetSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioInetSocketAddressClass.C.p =
  struct
    type 'a proxy_address = unit
    type 'a inet_socket_address_class = 'a GioInetSocketAddressClass.class
    type 'a class = 'a proxy_address inet_socket_address_class
    type t = base class
    fun toBase obj = obj
    val t = GioInetSocketAddressClass.t
    val tOpt = GioInetSocketAddressClass.tOpt
    structure C = GioInetSocketAddressClass.C
  end
