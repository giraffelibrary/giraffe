signature G_OBJECT_CLOSURE =
  sig
    type t
    type type_t
    val getType : unit -> type_t
    val invalidate : t -> unit
  end
