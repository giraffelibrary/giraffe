signature GIO_SOCKET_CONTROL_MESSAGE =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getLevel : 'a class_t -> LargeInt.int
    val getMsgType : 'a class_t -> LargeInt.int
    val getSize : 'a class_t -> LargeInt.int
  end
