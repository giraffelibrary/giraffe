signature GIO_SOCKET_ADDRESS =
  sig
    type 'a class
    type 'a socket_connectable_class
    type socket_family_t
    type t = base class
    val asSocketConnectable : 'a class -> base socket_connectable_class
    val getType : unit -> GObject.Type.t
    val getFamily : 'a class -> socket_family_t
    val getNativeSize : 'a class -> LargeInt.int
    val familyProp : {get : 'a class -> socket_family_t}
  end
