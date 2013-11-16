signature GIO_ASYNC_RESULT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getSourceObject : 'a class_t -> base GObject.ObjectClass.t
  end
