signature GIO_MEMORY_INPUT_STREAM =
  sig
    type 'a class
    type 'a seekable_class
    type t = base class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
  end
