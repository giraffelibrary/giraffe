signature G_LIB_SOURCE_FUNC =
  sig
    type func = unit -> bool
    include
      NOTIFIED_CALLBACK
        where type t = func
  end
