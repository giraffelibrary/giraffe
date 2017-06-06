signature GIO_I_O_EXTENSION =
  sig
    type t
    val getName : t -> string
    val getPriority : t -> LargeInt.int
  end
