structure GioSimpleProxyResolverClass :>
  GIO_SIMPLE_PROXY_RESOLVER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a simple_proxy_resolver = unit
    type 'a class = 'a simple_proxy_resolver class
  end
