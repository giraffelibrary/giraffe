signature PANGO_FONT =
  sig
    type 'a class
    type font_description_t
    type 'a font_map_class
    type rectangle_t
    type font_metrics_t
    type language_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val describe : 'a class -> font_description_t
    val describeWithAbsoluteSize : 'a class -> font_description_t
    val getFontMap : 'a class -> base font_map_class
    val getGlyphExtents :
      'a class
       -> LargeInt.int
       -> rectangle_t * rectangle_t
    val getMetrics :
      'a class
       -> language_t option
       -> font_metrics_t
  end
