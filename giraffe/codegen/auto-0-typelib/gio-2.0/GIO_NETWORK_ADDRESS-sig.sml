signature GIO_NETWORK_ADDRESS =
  sig
    type 'a class
    type 'a socket_connectable_class
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val new : string * LargeInt.int -> base class
    val newLoopback : LargeInt.int -> base class
    val parse : string * LargeInt.int -> base class
    val parseUri : string * LargeInt.int -> base class
    val getHostname : 'a class -> string
    val getPort : 'a class -> LargeInt.int
    val getScheme : 'a class -> string
    val hostnameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val portProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val schemeProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
  end
