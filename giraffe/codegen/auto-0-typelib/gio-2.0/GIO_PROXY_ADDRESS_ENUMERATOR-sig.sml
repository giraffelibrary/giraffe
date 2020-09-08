signature GIO_PROXY_ADDRESS_ENUMERATOR =
  sig
    type 'a class
    type 'a socket_connectable_class
    type 'a proxy_resolver_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val connectableProp : ('a class, unit -> base socket_connectable_class option, unit, 'b socket_connectable_class option -> unit) Property.t
    val defaultPortProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
    val proxyResolverProp : ('a class, unit -> base proxy_resolver_class option, 'b proxy_resolver_class option -> unit, 'b proxy_resolver_class option -> unit) Property.t
    val uriProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
  end
