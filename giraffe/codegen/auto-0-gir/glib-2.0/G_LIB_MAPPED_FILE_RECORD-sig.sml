signature G_LIB_MAPPED_FILE_RECORD =
  sig
    include RECORD
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
