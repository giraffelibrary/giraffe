signature GIO_BUS_NAME_WATCHER_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val AUTO_START : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end