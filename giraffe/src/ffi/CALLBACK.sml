signature CALLBACK =
  sig
    type t

    structure FFI :
      sig
        type notnull
        type 'a p

        type callback
        val withCallback : (callback -> 'a) -> t -> 'a
        val withOptCallback : (callback -> 'a) -> t option -> 'a

        val withPtrToDispatch : (notnull p -> 'a) -> unit -> 'a
        val withOptPtrToDispatch : (unit p -> 'a) -> bool -> 'a
      end
  end
