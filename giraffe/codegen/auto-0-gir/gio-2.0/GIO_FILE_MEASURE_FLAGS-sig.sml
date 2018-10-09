signature GIO_FILE_MEASURE_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val REPORT_ANY_ERROR : t
    val APPARENT_SIZE : t
    val NO_XDEV : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
