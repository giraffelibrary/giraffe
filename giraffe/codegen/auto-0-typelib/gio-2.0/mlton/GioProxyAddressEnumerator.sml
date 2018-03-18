structure GioProxyAddressEnumerator :>
  GIO_PROXY_ADDRESS_ENUMERATOR
    where type 'a class = 'a GioProxyAddressEnumeratorClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a proxy_resolver_class = 'a GioProxyResolverClass.class =
  struct
    val getType_ = _import "g_proxy_address_enumerator_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GioProxyAddressEnumeratorClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a proxy_resolver_class = 'a GioProxyResolverClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open Property
    in
      val connectableProp =
        {
          get = fn x => get "connectable" GioSocketConnectableClass.tOpt x,
          new = fn x => new "connectable" GioSocketConnectableClass.tOpt x
        }
      val defaultPortProp =
        {
          get = fn x => get "default-port" uint x,
          new = fn x => new "default-port" uint x
        }
      val proxyResolverProp =
        {
          get = fn x => get "proxy-resolver" GioProxyResolverClass.tOpt x,
          set = fn x => set "proxy-resolver" GioProxyResolverClass.tOpt x,
          new = fn x => new "proxy-resolver" GioProxyResolverClass.tOpt x
        }
      val uriProp =
        {
          get = fn x => get "uri" stringOpt x,
          new = fn x => new "uri" stringOpt x
        }
    end
  end
