structure PangoFont :>
  PANGO_FONT
    where type 'a class_t = 'a PangoFontClass.t
    where type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    where type 'a fontmapclass_t = 'a PangoFontMapClass.t
    where type rectanglerecord_t = PangoRectangleRecord.t
    where type fontmetricsrecord_t = PangoFontMetricsRecord.t
    where type languagerecord_t = PangoLanguageRecord.t =
  struct
    val getType_ = _import "pango_font_get_type" : unit -> GObjectType.C.val_;
    val describe_ = _import "pango_font_describe" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val describeWithAbsoluteSize_ = _import "pango_font_describe_with_absolute_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getFontMap_ = _import "pango_font_get_font_map" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getGlyphExtents_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_font_get_glyph_extents" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMetrics_ = fn x1 & x2 => (_import "pango_font_get_metrics" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit PangoLanguageRecord.C.p -> PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p;) (x1, x2)
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
