signature G_LIB_SPAWN_CHILD_SETUP_FUNC =
  sig
    type t = unit -> unit

    structure C :
      sig
        type callback
        val withCallback : (callback -> 'a) -> t -> 'a
        val withOptCallback : (callback -> 'a) -> t option -> 'a
      end
  end
