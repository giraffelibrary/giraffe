signature G_LIB_CHILD_WATCH_FUNC =
  sig
    type pid_t
    type func = pid_t * LargeInt.int -> unit
    include
      NOTIFIED_CALLBACK
        where type t = func
  end
