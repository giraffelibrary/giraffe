signature GDK_COLOR_RECORD =
  sig
    include VALUE_RECORD
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
