structure GioResolverClass :>
  GIO_RESOLVER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a resolver = unit
    type 'a class = 'a resolver class
  end
