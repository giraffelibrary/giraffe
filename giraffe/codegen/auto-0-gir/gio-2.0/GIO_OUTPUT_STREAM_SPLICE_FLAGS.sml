signature GIO_OUTPUT_STREAM_SPLICE_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val CLOSE_SOURCE : t
    val CLOSE_TARGET : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
