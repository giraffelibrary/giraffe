structure GioSocketConnectable :>
  GIO_SOCKET_CONNECTABLE
    where type 'a class = 'a GioSocketConnectableClass.class
    where type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class =
  struct
    val getType_ = _import "g_socket_connectable_get_type" : unit -> GObjectType.FFI.val_;
    val enumerate_ = _import "g_socket_connectable_enumerate" : GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p -> GioSocketAddressEnumeratorClass.FFI.non_opt GioSocketAddressEnumeratorClass.FFI.p;
    val proxyEnumerate_ = _import "g_socket_connectable_proxy_enumerate" : GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p -> GioSocketAddressEnumeratorClass.FFI.non_opt GioSocketAddressEnumeratorClass.FFI.p;
    val toString_ = _import "g_socket_connectable_to_string" : GioSocketConnectableClass.FFI.non_opt GioSocketConnectableClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type 'a class = 'a GioSocketConnectableClass.class
    type 'a socket_address_enumerator_class = 'a GioSocketAddressEnumeratorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun enumerate self = (GioSocketConnectableClass.FFI.withPtr ---> GioSocketAddressEnumeratorClass.FFI.fromPtr true) enumerate_ self
    fun proxyEnumerate self = (GioSocketConnectableClass.FFI.withPtr ---> GioSocketAddressEnumeratorClass.FFI.fromPtr true) proxyEnumerate_ self
    fun toString self = (GioSocketConnectableClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
