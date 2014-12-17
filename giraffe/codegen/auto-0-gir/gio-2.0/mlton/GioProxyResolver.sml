structure GioProxyResolver :>
  GIO_PROXY_RESOLVER
    where type 'a class_t = 'a GioProxyResolverClass.t =
  struct
    val getType_ = _import "g_proxy_resolver_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "g_proxy_resolver_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val isSupported_ = _import "g_proxy_resolver_is_supported" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a GioProxyResolverClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioProxyResolverClass.C.fromPtr false) getDefault_ ()
    fun isSupported self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isSupported_ self
  end
