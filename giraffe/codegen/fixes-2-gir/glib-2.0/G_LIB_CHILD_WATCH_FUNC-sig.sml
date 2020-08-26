signature G_LIB_CHILD_WATCH_FUNC =
  sig
    type pid_t
    type func = pid_t * LargeInt.int -> unit
    include
      CALLBACK
        where type t = func
  end
