signature GIO_SIMPLE_PROXY_RESOLVER =
  sig
    type 'a class
    type 'a proxy_resolver_class
    type t = base class
    val asProxyResolver : 'a class -> base proxy_resolver_class
    val getType : unit -> GObject.Type.t
    val new : string option * string option -> base proxy_resolver_class
    val setDefaultProxy :
      'a class
       -> string
       -> unit
    val setIgnoreHosts :
      'a class
       -> string
       -> unit
    val setUriProxy :
      'a class
       -> string * string
       -> unit
    val defaultProxyProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
