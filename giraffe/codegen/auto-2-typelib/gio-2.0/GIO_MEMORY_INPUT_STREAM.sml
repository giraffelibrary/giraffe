signature GIO_MEMORY_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a seekableclass_t
    val asSeekable : 'a class_t -> base seekableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
  end
