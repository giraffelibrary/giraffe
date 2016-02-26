structure GioProxyResolver :>
  GIO_PROXY_RESOLVER
    where type 'a class_t = 'a GioProxyResolverClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_proxy_resolver_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libgio "g_proxy_resolver_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val isSupported_ = call (load_sym libgio "g_proxy_resolver_is_supported") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a GioProxyResolverClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GioProxyResolverClass.C.fromPtr false) getDefault_ ()
    fun isSupported self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isSupported_ self
  end
