signature PANGO_CAIRO_FC_FONT_MAP =
  sig
    type 'a class_t
    type 'a font_map_class_t
    type t = base class_t
    val asFontMap : 'a class_t -> base font_map_class_t
    val getType : unit -> GObject.Type.t
  end
