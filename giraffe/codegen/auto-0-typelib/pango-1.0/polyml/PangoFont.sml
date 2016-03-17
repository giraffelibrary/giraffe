structure PangoFont :>
  PANGO_FONT
    where type 'a class = 'a PangoFontClass.class
    where type font_description_t = PangoFontDescriptionRecord.t
    where type 'a font_map_class = 'a PangoFontMapClass.class
    where type rectangle_t = PangoRectangleRecord.t
    where type font_metrics_t = PangoFontMetricsRecord.t
    where type language_t = PangoLanguageRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val describe_ = call (load_sym libpango "pango_font_describe") (GObjectObjectClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val describeWithAbsoluteSize_ = call (load_sym libpango "pango_font_describe_with_absolute_size") (GObjectObjectClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontMap_ = call (load_sym libpango "pango_font_get_font_map") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getGlyphExtents_ =
        call (load_sym libpango "pango_font_get_glyph_extents")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getMetrics_ = call (load_sym libpango "pango_font_get_metrics") (GObjectObjectClass.PolyML.cPtr &&> PangoLanguageRecord.PolyML.cOptPtr --> PangoFontMetricsRecord.PolyML.cPtr)
    end
    type 'a class = 'a PangoFontClass.class
    type font_description_t = PangoFontDescriptionRecord.t
    type 'a font_map_class = 'a PangoFontMapClass.class
    type rectangle_t = PangoRectangleRecord.t
    type font_metrics_t = PangoFontMetricsRecord.t
    type language_t = PangoLanguageRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun describe self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) describe_ self
    fun describeWithAbsoluteSize self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) describeWithAbsoluteSize_ self
    fun getFontMap self = (GObjectObjectClass.C.withPtr ---> PangoFontMapClass.C.fromPtr false) getFontMap_ self
    fun getGlyphExtents self glyph =
      let
        val inkRect
         & logicalRect
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withVal
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getGlyphExtents_
            (
              self
               & glyph
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getMetrics self language = (GObjectObjectClass.C.withPtr &&&> PangoLanguageRecord.C.withOptPtr ---> PangoFontMetricsRecord.C.fromPtr true) getMetrics_ (self & language)
  end
