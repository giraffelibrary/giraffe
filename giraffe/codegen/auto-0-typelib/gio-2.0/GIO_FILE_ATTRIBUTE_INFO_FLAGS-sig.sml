signature GIO_FILE_ATTRIBUTE_INFO_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val COPY_WITH_FILE : t
    val COPY_WHEN_MOVED : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
