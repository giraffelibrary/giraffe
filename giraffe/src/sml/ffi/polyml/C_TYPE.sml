signature C_TYPE =
  sig
    type t
    val size : word
    val get : PolyMLFFI.Memory.Pointer.t * int -> t
    val set : PolyMLFFI.Memory.Pointer.t * int * t -> unit
  end
