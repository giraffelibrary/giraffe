signature GIO_MEMORY_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a seekable_class_t
    type t = base class_t
    val asSeekable : 'a class_t -> base seekable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
  end
