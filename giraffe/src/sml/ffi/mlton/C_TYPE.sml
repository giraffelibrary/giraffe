signature C_TYPE =
  sig
    type t
    val size : word
    val get : MLton.Pointer.t * int -> t
    val set : MLton.Pointer.t * int * t -> unit
  end
