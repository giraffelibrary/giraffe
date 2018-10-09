signature GDK_RECTANGLE_RECORD =
  sig
    include VALUE_RECORD
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
