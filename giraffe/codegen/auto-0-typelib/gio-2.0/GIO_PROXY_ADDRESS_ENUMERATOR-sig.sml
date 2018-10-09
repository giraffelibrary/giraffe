signature GIO_PROXY_ADDRESS_ENUMERATOR =
  sig
    type 'a class
    type 'a socket_connectable_class
    type 'a proxy_resolver_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val connectableProp :
      {
        get : 'a class -> base socket_connectable_class option,
        new : 'b socket_connectable_class option -> 'a class Property.t
      }
    val defaultPortProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val proxyResolverProp :
      {
        get : 'a class -> base proxy_resolver_class option,
        set :
          'b proxy_resolver_class option
           -> 'a class
           -> unit,
        new : 'b proxy_resolver_class option -> 'a class Property.t
      }
    val uriProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
