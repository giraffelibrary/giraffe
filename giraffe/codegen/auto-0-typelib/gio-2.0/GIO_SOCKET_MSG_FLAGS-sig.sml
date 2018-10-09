signature GIO_SOCKET_MSG_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val OOB : t
    val PEEK : t
    val DONTROUTE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
