signature GIRAFFE_DEBUG =
  sig
    (* `isEnabled` is fixed at compile-time. *)
    val isEnabled : bool

    val getRefCount : unit -> bool
    val getClosure : unit -> bool
  end
