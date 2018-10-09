signature G_LIB_SPAWN_CHILD_SETUP_FUNC =
  sig
    type func = unit -> unit
    include
      CALLBACK
        where type t = func
  end
