signature PANGO_GLYPH_ITEM_ITER_RECORD =
  sig
    include RECORD
    val t : (t, t) ValueAccessor.t
    val tOpt : (t option, t option) ValueAccessor.t
  end
