structure GioProxyAddressEnumeratorClass :>
  GIO_PROXY_ADDRESS_ENUMERATOR_CLASS
    where type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    where type C.notnull = GioSocketAddressEnumeratorClass.C.notnull
    where type 'a C.p = 'a GioSocketAddressEnumeratorClass.C.p =
  struct
    type 'a proxy_address_enumerator = unit
    type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    type 'a class = 'a proxy_address_enumerator socket_address_enumerator_class
    type t = base class
    fun toBase obj = obj
    val t = GioSocketAddressEnumeratorClass.t
    val tOpt = GioSocketAddressEnumeratorClass.tOpt
    structure C = GioSocketAddressEnumeratorClass.C
  end
