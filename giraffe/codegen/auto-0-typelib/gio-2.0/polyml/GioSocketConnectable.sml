structure GioSocketConnectable :>
  GIO_SOCKET_CONNECTABLE
    where type 'a class = 'a GioSocketConnectableClass.class
    where type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_connectable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val enumerate_ = call (load_sym libgio "g_socket_connectable_enumerate") (GioSocketConnectableClass.PolyML.cPtr --> GioSocketAddressEnumeratorClass.PolyML.cPtr)
      val proxyEnumerate_ = call (load_sym libgio "g_socket_connectable_proxy_enumerate") (GioSocketConnectableClass.PolyML.cPtr --> GioSocketAddressEnumeratorClass.PolyML.cPtr)
    end
    type 'a class = 'a GioSocketConnectableClass.class
    type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun enumerate self = (GioSocketConnectableClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) enumerate_ self
    fun proxyEnumerate self = (GioSocketConnectableClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) proxyEnumerate_ self
  end
