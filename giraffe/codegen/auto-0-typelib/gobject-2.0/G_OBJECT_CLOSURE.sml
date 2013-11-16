signature G_OBJECT_CLOSURE =
  sig
    type record_t
    type type_t
    val getType : unit -> type_t
    val invalidate : record_t -> unit
  end
