signature GIO_I_O_STREAM_SPLICE_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val CLOSE_STREAM_1 : t
    val CLOSE_STREAM_2 : t
    val WAIT_FOR_BOTH : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
