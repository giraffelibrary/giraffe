signature GTK_BORDER_RECORD =
  sig
    include VALUE_RECORD
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
