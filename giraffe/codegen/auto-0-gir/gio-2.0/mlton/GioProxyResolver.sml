structure GioProxyResolver :>
  GIO_PROXY_RESOLVER
    where type 'a class = 'a GioProxyResolverClass.class =
  struct
    val getType_ = _import "g_proxy_resolver_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "g_proxy_resolver_get_default" : unit -> GioProxyResolverClass.C.notnull GioProxyResolverClass.C.p;
    val isSupported_ = _import "g_proxy_resolver_is_supported" : GioProxyResolverClass.C.notnull GioProxyResolverClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GioProxyResolverClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioProxyResolverClass.C.fromPtr false) getDefault_ ()
    fun isSupported self = (GioProxyResolverClass.C.withPtr ---> FFI.Bool.C.fromVal) isSupported_ self
  end
