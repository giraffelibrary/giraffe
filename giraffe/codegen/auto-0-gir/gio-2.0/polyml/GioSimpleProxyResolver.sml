structure GioSimpleProxyResolver :>
  GIO_SIMPLE_PROXY_RESOLVER
    where type 'a class = 'a GioSimpleProxyResolverClass.class
    where type 'a proxy_resolver_class = 'a GioProxyResolverClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_simple_proxy_resolver_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_simple_proxy_resolver_new") (Utf8.PolyML.cInOptPtr &&> Utf8.PolyML.cInOptPtr --> GioProxyResolverClass.PolyML.cPtr)
      val setDefaultProxy_ = call (getSymbol "g_simple_proxy_resolver_set_default_proxy") (GioSimpleProxyResolverClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setIgnoreHosts_ = call (getSymbol "g_simple_proxy_resolver_set_ignore_hosts") (GioSimpleProxyResolverClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setUriProxy_ =
        call (getSymbol "g_simple_proxy_resolver_set_uri_proxy")
          (
            GioSimpleProxyResolverClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
    end
    type 'a class = 'a GioSimpleProxyResolverClass.class
    type 'a proxy_resolver_class = 'a GioProxyResolverClass.class
    type t = base class
    fun asProxyResolver self = (GObjectObjectClass.FFI.withPtr false ---> GioProxyResolverClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (defaultProxy, ignoreHosts) = (Utf8.FFI.withOptPtr 0 &&&> Utf8.FFI.withOptPtr 0 ---> GioProxyResolverClass.FFI.fromPtr true) new_ (defaultProxy & ignoreHosts)
    fun setDefaultProxy self defaultProxy = (GioSimpleProxyResolverClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDefaultProxy_ (self & defaultProxy)
    fun setIgnoreHosts self ignoreHosts = (GioSimpleProxyResolverClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setIgnoreHosts_ (self & ignoreHosts)
    fun setUriProxy self (uriScheme, proxy) =
      (
        GioSimpleProxyResolverClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setUriProxy_
        (
          self
           & uriScheme
           & proxy
        )
    local
      open Property
    in
      val defaultProxyProp =
        {
          get = fn x => get "default-proxy" stringOpt x,
          set = fn x => set "default-proxy" stringOpt x,
          new = fn x => new "default-proxy" stringOpt x
        }
    end
  end
