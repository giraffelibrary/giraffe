signature G_OBJECT_CLOSURE =
  sig
    type t
    type type_t
    type 'a marshaller
    val getType : unit -> type_t
    val new : ('a -> 'b) marshaller -> ('a -> 'b) -> t
    val invalidate : t -> unit
  end
