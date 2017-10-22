signature GIO_INET_SOCKET_ADDRESS =
  sig
    type 'a class
    type 'a socket_connectable_class
    type 'a inet_address_class
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val new : 'a inet_address_class * LargeInt.int -> base class
    val newFromString : string * LargeInt.int -> base class
    val getAddress : 'a class -> base inet_address_class
    val getFlowinfo : 'a class -> LargeInt.int
    val getPort : 'a class -> LargeInt.int
    val getScopeId : 'a class -> LargeInt.int
    val addressProp : ('a class, base inet_address_class option, 'b inet_address_class option) Property.readwrite
    val flowinfoProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val portProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val scopeIdProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
