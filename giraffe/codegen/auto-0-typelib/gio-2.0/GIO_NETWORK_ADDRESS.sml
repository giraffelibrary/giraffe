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
    val hostnameProp : ('a class, string option, string option) Property.readwrite
    val portProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val schemeProp : ('a class, string option, string option) Property.readwrite
  end
