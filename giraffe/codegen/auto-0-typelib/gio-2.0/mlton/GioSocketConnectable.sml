structure GioSocketConnectable :>
  GIO_SOCKET_CONNECTABLE
    where type 'a class_t = 'a GioSocketConnectableClass.t
    where type 'a socketaddressenumeratorclass_t = 'a GioSocketAddressEnumeratorClass.t =
  struct
    val getType_ = _import "g_socket_connectable_get_type" : unit -> GObjectType.C.val_;
    val enumerate_ = _import "g_socket_connectable_enumerate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val proxyEnumerate_ = _import "g_socket_connectable_proxy_enumerate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GioSocketConnectableClass.t
    type 'a socketaddressenumeratorclass_t = 'a GioSocketAddressEnumeratorClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun enumerate self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) enumerate_ self
    fun proxyEnumerate self = (GObjectObjectClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) proxyEnumerate_ self
  end
