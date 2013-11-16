signature GIO_SOCKET_ADDRESS =
  sig
    type 'a class_t
    type socketfamily_t
    type 'a socketconnectableclass_t
    val asSocketConnectable : 'a class_t -> base socketconnectableclass_t
    val getType : unit -> GObject.Type.t
    val getFamily : 'a class_t -> socketfamily_t
    val getNativeSize : 'a class_t -> LargeInt.int
    val familyProp : ('a class_t, socketfamily_t) Property.readonly
  end
