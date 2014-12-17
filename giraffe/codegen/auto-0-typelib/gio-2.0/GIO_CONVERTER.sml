signature GIO_CONVERTER =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val reset : 'a class_t -> unit
  end
