signature G_LIB_CHILD_WATCH_FUNC =
  sig
    type t = Pid.t * LargeInt.int -> unit

    structure C :
      sig
        type callback
        val withCallback : (callback -> 'a) -> t -> 'a
      end
  end
