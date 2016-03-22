structure GioSocketConnectable :>
  GIO_SOCKET_CONNECTABLE
    where type 'a class = 'a GioSocketConnectableClass.class
    where type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class =
  struct
    val getType_ = _import "g_socket_connectable_get_type" : unit -> GObjectType.C.val_;
    val enumerate_ = _import "g_socket_connectable_enumerate" : GioSocketConnectableClass.C.notnull GioSocketConnectableClass.C.p -> GioSocketAddressEnumeratorClass.C.notnull GioSocketAddressEnumeratorClass.C.p;
    val proxyEnumerate_ = _import "g_socket_connectable_proxy_enumerate" : GioSocketConnectableClass.C.notnull GioSocketConnectableClass.C.p -> GioSocketAddressEnumeratorClass.C.notnull GioSocketAddressEnumeratorClass.C.p;
    type 'a class = 'a GioSocketConnectableClass.class
    type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun enumerate self = (GioSocketConnectableClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) enumerate_ self
    fun proxyEnumerate self = (GioSocketConnectableClass.C.withPtr ---> GioSocketAddressEnumeratorClass.C.fromPtr true) proxyEnumerate_ self
  end
