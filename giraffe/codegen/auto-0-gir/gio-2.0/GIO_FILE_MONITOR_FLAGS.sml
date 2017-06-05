signature GIO_FILE_MONITOR_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val WATCH_MOUNTS : t
    val SEND_MOVED : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
