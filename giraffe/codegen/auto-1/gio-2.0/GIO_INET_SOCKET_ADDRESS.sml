signature GIO_INET_SOCKET_ADDRESS =
  sig
    type 'a class_t
    type 'a inetaddressclass_t
    type 'a socketconnectableclass_t
    val asSocketConnectable : 'a class_t -> base socketconnectableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a inetaddressclass_t
       -> LargeInt.int
       -> base class_t
    val getAddress : 'a class_t -> base inetaddressclass_t
    val getPort : 'a class_t -> LargeInt.int
    val addressProp : ('a class_t, base inetaddressclass_t option, 'b inetaddressclass_t option) Property.readwrite
    val portProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
