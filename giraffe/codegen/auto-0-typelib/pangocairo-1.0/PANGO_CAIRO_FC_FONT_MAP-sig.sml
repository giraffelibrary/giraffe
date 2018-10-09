signature PANGO_CAIRO_FC_FONT_MAP =
  sig
    type 'a class
    type 'a font_map_class
    type t = base class
    val asFontMap : 'a class -> base font_map_class
    val getType : unit -> GObject.Type.t
  end
