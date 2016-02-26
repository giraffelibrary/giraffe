structure GioSocketConnectable :>
  GIO_SOCKET_CONNECTABLE
    where type 'a class_t = 'a GioSocketConnectableClass.t
    where type 'a socket_address_enumerator_class_t = 'a GioSocketAddressEnumeratorClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_connectable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val enumerate_ = call (load_sym libgio "g_socket_connectable_enumerate") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val proxyEnumerate_ = call (load_sym libgio "g_socket_connectable_proxy_enumerate") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GioSocketConnectableClass.t
    type 'a socket_address_enumerator_class_t = 'a GioSocketAddressEnumeratorClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun enumerate self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) enumerate_ self
    fun proxyEnumerate self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) proxyEnumerate_ self
  end
