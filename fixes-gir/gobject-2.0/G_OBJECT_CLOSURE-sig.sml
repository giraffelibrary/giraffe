signature G_OBJECT_CLOSURE =
  sig
    type t
    type type_t
    type callback
    val getType : unit -> type_t
    val new : callback -> t
    val invalidate : t -> unit
  end
