structure PangoFont :>
  PANGO_FONT
    where type 'a class_t = 'a PangoFontClass.t
    where type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    where type 'a fontmapclass_t = 'a PangoFontMapClass.t
    where type rectanglerecord_t = PangoRectangleRecord.t
    where type fontmetricsrecord_t = PangoFontMetricsRecord.t
    where type languagerecord_t = PangoLanguageRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val describe_ = call (load_sym libpango "pango_font_describe") (GObjectObjectClass.PolyML.PTR --> PangoFontDescriptionRecord.PolyML.PTR)
      val describeWithAbsoluteSize_ = call (load_sym libpango "pango_font_describe_with_absolute_size") (GObjectObjectClass.PolyML.PTR --> PangoFontDescriptionRecord.PolyML.PTR)
      val getFontMap_ = call (load_sym libpango "pango_font_get_font_map") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getGlyphExtents_ =
        call (load_sym libpango "pango_font_get_glyph_extents")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getMetrics_ = call (load_sym libpango "pango_font_get_metrics") (GObjectObjectClass.PolyML.PTR &&> PangoLanguageRecord.PolyML.OPTPTR --> PangoFontMetricsRecord.PolyML.PTR)
    end
    type 'a class_t = 'a PangoFontClass.t
    type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    type 'a fontmapclass_t = 'a PangoFontMapClass.t
    type rectanglerecord_t = PangoRectangleRecord.t
    type fontmetricsrecord_t = PangoFontMetricsRecord.t
    type languagerecord_t = PangoLanguageRecord.t
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
             &&&> FFI.Word32.withVal
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
