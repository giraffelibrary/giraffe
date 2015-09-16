signature GIO_INET_SOCKET_ADDRESS =
  sig
    type 'a class_t
    type 'a socket_connectable_class_t
    type 'a inet_address_class_t
    type t = base class_t
    val asSocketConnectable : 'a class_t -> base socket_connectable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a inet_address_class_t
       -> LargeInt.int
       -> base class_t
    val getAddress : 'a class_t -> base inet_address_class_t
    val getPort : 'a class_t -> LargeInt.int
    val addressProp : ('a class_t, base inet_address_class_t option, 'b inet_address_class_t option) Property.readwrite
    val portProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
