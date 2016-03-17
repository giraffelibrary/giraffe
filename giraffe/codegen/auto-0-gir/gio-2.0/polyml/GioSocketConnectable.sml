structure GioSocketConnectable :>
  GIO_SOCKET_CONNECTABLE
    where type 'a class = 'a GioSocketConnectableClass.class
    where type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_connectable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val enumerate_ = call (load_sym libgio "g_socket_connectable_enumerate") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val proxyEnumerate_ = call (load_sym libgio "g_socket_connectable_proxy_enumerate") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GioSocketConnectableClass.class
    type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun enumerate self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) enumerate_ self
    fun proxyEnumerate self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) proxyEnumerate_ self
  end
