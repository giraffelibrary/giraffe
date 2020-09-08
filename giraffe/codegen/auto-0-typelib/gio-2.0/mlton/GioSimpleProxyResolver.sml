structure GioSimpleProxyResolver :>
  GIO_SIMPLE_PROXY_RESOLVER
    where type 'a class = 'a GioSimpleProxyResolverClass.class
    where type 'a proxy_resolver_class = 'a GioProxyResolverClass.class =
  struct
    val getType_ = _import "g_simple_proxy_resolver_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_simple_proxy_resolver_new" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GioProxyResolverClass.FFI.non_opt GioProxyResolverClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDefaultProxy_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_simple_proxy_resolver_set_default_proxy" :
              GioSimpleProxyResolverClass.FFI.non_opt GioSimpleProxyResolverClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIgnoreHosts_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_simple_proxy_resolver_set_ignore_hosts" :
              GioSimpleProxyResolverClass.FFI.non_opt GioSimpleProxyResolverClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUriProxy_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_simple_proxy_resolver_set_uri_proxy" :
              GioSimpleProxyResolverClass.FFI.non_opt GioSimpleProxyResolverClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
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
      open ValueAccessor
    in
      val defaultProxyProp =
        {
          name = "default-proxy",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
