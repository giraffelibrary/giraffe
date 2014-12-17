signature PANGO_FONT =
  sig
    type 'a class_t
    type fontdescriptionrecord_t
    type 'a fontmapclass_t
    type rectanglerecord_t
    type glyph_t
    type fontmetricsrecord_t
    type languagerecord_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val describe : 'a class_t -> fontdescriptionrecord_t
    val describeWithAbsoluteSize : 'a class_t -> fontdescriptionrecord_t
    val getFontMap : 'a class_t -> base fontmapclass_t
    val getGlyphExtents :
      'a class_t
       -> glyph_t
       -> rectanglerecord_t * rectanglerecord_t
    val getMetrics :
      'a class_t
       -> languagerecord_t option
       -> fontmetricsrecord_t
  end
