structure PangoFont :>
  PANGO_FONT
    where type 'a class = 'a PangoFontClass.class
    where type font_description_t = PangoFontDescriptionRecord.t
    where type 'a font_map_class = 'a PangoFontMapClass.class
    where type rectangle_t = PangoRectangleRecord.t
    where type glyph_t = PangoGlyph.t
    where type font_metrics_t = PangoFontMetricsRecord.t
    where type language_t = PangoLanguageRecord.t =
  struct
    val getType_ = _import "pango_font_get_type" : unit -> GObjectType.FFI.val_;
    val describe_ = _import "pango_font_describe" : PangoFontClass.FFI.non_opt PangoFontClass.FFI.p -> PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p;
    val describeWithAbsoluteSize_ = _import "pango_font_describe_with_absolute_size" : PangoFontClass.FFI.non_opt PangoFontClass.FFI.p -> PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p;
    val getFontMap_ = _import "pango_font_get_font_map" : PangoFontClass.FFI.non_opt PangoFontClass.FFI.p -> PangoFontMapClass.FFI.opt PangoFontMapClass.FFI.p;
    val getGlyphExtents_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_font_get_glyph_extents" :
              PangoFontClass.FFI.non_opt PangoFontClass.FFI.p
               * PangoGlyph.FFI.val_
               * PangoRectangleRecord.FFI.non_opt PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.non_opt PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMetrics_ = fn x1 & x2 => (_import "pango_font_get_metrics" : PangoFontClass.FFI.non_opt PangoFontClass.FFI.p * PangoLanguageRecord.FFI.opt PangoLanguageRecord.FFI.p -> PangoFontMetricsRecord.FFI.non_opt PangoFontMetricsRecord.FFI.p;) (x1, x2)
    type 'a class = 'a PangoFontClass.class
    type font_description_t = PangoFontDescriptionRecord.t
    type 'a font_map_class = 'a PangoFontMapClass.class
    type rectangle_t = PangoRectangleRecord.t
    type glyph_t = PangoGlyph.t
    type font_metrics_t = PangoFontMetricsRecord.t
    type language_t = PangoLanguageRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun describe self = (PangoFontClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr true) describe_ self
    fun describeWithAbsoluteSize self = (PangoFontClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr true) describeWithAbsoluteSize_ self
    fun getFontMap self = (PangoFontClass.FFI.withPtr false ---> PangoFontMapClass.FFI.fromOptPtr false) getFontMap_ self before PangoFontClass.FFI.touchPtr self
    fun getGlyphExtents self glyph =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoFontClass.FFI.withPtr false
             &&&> PangoGlyph.FFI.withVal
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
    fun getMetrics self language = (PangoFontClass.FFI.withPtr false &&&> PangoLanguageRecord.FFI.withOptPtr false ---> PangoFontMetricsRecord.FFI.fromPtr true) getMetrics_ (self & language)
  end
