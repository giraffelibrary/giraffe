signature GIO_SOCKET_ADDRESS =
  sig
    type 'a class_t
    type 'a socket_connectable_class_t
    type socket_family_t
    type t = base class_t
    val asSocketConnectable : 'a class_t -> base socket_connectable_class_t
    val getType : unit -> GObject.Type.t
    val getFamily : 'a class_t -> socket_family_t
    val getNativeSize : 'a class_t -> LargeInt.int
    val familyProp : ('a class_t, socket_family_t) Property.readonly
  end
