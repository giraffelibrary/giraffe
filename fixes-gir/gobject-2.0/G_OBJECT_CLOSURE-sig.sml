signature G_OBJECT_CLOSURE =
  sig
    type t
    type type_t
    type ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller
    val getType : unit -> type_t
    val new : ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller * ('arg_r -> 'res_w) -> t
    val invalidate : t -> unit
  end
