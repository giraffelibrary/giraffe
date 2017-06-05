signature G_LIB_CHILD_WATCH_FUNC =
  sig
    type pid_t
    type t = pid_t * LargeInt.int -> unit

    structure FFI :
      sig
        type callback
        val withCallback : (callback -> 'a) -> t -> 'a
      end
  end
