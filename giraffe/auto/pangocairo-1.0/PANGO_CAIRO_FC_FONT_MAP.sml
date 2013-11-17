signature PANGO_CAIRO_FC_FONT_MAP =
  sig
    type 'a class_t
    type 'a fontmapclass_t
    val asFontMap : 'a class_t -> base fontmapclass_t
    val getType : unit -> GObject.Type.t
  end
