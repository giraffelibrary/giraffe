signature GTK_SELECTION_DATA_RECORD =
  sig
    include RECORD
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
