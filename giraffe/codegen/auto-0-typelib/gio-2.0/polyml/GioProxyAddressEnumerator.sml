structure GioProxyAddressEnumerator :>
  GIO_PROXY_ADDRESS_ENUMERATOR
    where type 'a class = 'a GioProxyAddressEnumeratorClass.class
    where type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    where type 'a proxy_resolver_class = 'a GioProxyResolverClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_proxy_address_enumerator_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GioProxyAddressEnumeratorClass.class
    type 'a socket_connectable_class = 'a GioSocketConnectableClass.class
    type 'a proxy_resolver_class = 'a GioProxyResolverClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open ValueAccessor
    in
      val connectableProp =
        {
          name = "connectable",
          gtype = fn () => C.gtype GioSocketConnectableClass.tOpt (),
          get = fn x => fn () => C.get GioSocketConnectableClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioSocketConnectableClass.tOpt x
        }
      val defaultPortProp =
        {
          name = "default-port",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = fn x => C.set uint x
        }
      val proxyResolverProp =
        {
          name = "proxy-resolver",
          gtype = fn () => C.gtype GioProxyResolverClass.tOpt (),
          get = fn x => fn () => C.get GioProxyResolverClass.tOpt x,
          set = fn x => C.set GioProxyResolverClass.tOpt x,
          init = fn x => C.set GioProxyResolverClass.tOpt x
        }
      val uriProp =
        {
          name = "uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
