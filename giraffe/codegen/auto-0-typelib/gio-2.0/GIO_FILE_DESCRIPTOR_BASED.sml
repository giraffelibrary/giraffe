signature GIO_FILE_DESCRIPTOR_BASED =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getFd : 'a class_t -> LargeInt.int
  end
