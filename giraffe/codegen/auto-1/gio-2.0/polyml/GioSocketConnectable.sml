structure GioSocketConnectable :>
  GIO_SOCKET_CONNECTABLE
    where type 'a class_t = 'a GioSocketConnectableClass.t
    where type 'a socketaddressenumeratorclass_t = 'a GioSocketAddressEnumeratorClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_connectable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val enumerate_ = call (load_sym libgio "g_socket_connectable_enumerate") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val proxyEnumerate_ = call (load_sym libgio "g_socket_connectable_proxy_enumerate") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioSocketConnectableClass.t
    type 'a socketaddressenumeratorclass_t = 'a GioSocketAddressEnumeratorClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun enumerate self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) enumerate_ self
    fun proxyEnumerate self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) proxyEnumerate_ self
  end
