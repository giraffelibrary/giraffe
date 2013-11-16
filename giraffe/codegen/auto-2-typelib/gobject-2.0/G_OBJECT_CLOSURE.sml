signature G_OBJECT_CLOSURE =
  sig
    type record_t
    type type_t
    type 'a marshaller
    val getType : unit -> type_t
    val new : ('a -> 'b) marshaller -> ('a -> 'b) -> record_t
    val invalidate : record_t -> unit
  end
