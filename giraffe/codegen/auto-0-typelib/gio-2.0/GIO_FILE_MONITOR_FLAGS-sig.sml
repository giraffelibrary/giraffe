signature GIO_FILE_MONITOR_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val WATCH_MOUNTS : t
    val SEND_MOVED : t
    val WATCH_HARD_LINKS : t
    val WATCH_MOVES : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
