signature GIO_PROXY_ADDRESS_ENUMERATOR =
  sig
    type 'a class
    type 'a socket_connectable_class
    type 'a proxy_resolver_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val connectableProp : ('a class, base socket_connectable_class option, 'b socket_connectable_class option) Property.readwrite
    val defaultPortProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val proxyResolverProp : ('a class, base proxy_resolver_class option, 'b proxy_resolver_class option) Property.readwrite
    val uriProp : ('a class, string option, string option) Property.readwrite
  end
