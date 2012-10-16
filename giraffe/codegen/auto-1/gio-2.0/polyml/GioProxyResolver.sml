structure GioProxyResolver :>
  GIO_PROXY_RESOLVER
    where type 'a class_t = 'a GioProxyResolverClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_proxy_resolver_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libgio "g_proxy_resolver_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val isSupported_ = call (load_sym libgio "g_proxy_resolver_is_supported") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a GioProxyResolverClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioProxyResolverClass.C.fromPtr false) getDefault_ ()
    fun isSupported self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isSupported_ self
  end
