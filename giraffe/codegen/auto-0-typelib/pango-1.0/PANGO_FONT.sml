signature PANGO_FONT =
  sig
    type 'a class_t
    type font_description_record_t
    type 'a font_map_class_t
    type rectangle_record_t
    type font_metrics_record_t
    type language_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val describe : 'a class_t -> font_description_record_t
    val describeWithAbsoluteSize : 'a class_t -> font_description_record_t
    val getFontMap : 'a class_t -> base font_map_class_t
    val getGlyphExtents :
      'a class_t
       -> LargeInt.int
       -> rectangle_record_t * rectangle_record_t
    val getMetrics :
      'a class_t
       -> language_record_t option
       -> font_metrics_record_t
  end
