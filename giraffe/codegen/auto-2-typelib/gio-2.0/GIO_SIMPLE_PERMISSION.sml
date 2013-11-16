signature GIO_SIMPLE_PERMISSION =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new : bool -> base class_t
  end
