signature PANGO =
  sig
    structure Alignment : PANGO_ALIGNMENT
    structure AttrListRecord : PANGO_ATTR_LIST_RECORD
    structure AttrType : PANGO_ATTR_TYPE
    structure AttributeRecord : PANGO_ATTRIBUTE_RECORD
    structure BidiType : PANGO_BIDI_TYPE
    structure ColorRecord : PANGO_COLOR_RECORD
    structure ContextClass : PANGO_CONTEXT_CLASS
    structure CoverageLevel : PANGO_COVERAGE_LEVEL
    structure Direction : PANGO_DIRECTION
    structure EllipsizeMode : PANGO_ELLIPSIZE_MODE
    structure FontClass : PANGO_FONT_CLASS
    structure FontDescriptionRecord : PANGO_FONT_DESCRIPTION_RECORD
    structure FontFaceClass : PANGO_FONT_FACE_CLASS
    structure FontFamilyClass : PANGO_FONT_FAMILY_CLASS
    structure FontMapClass : PANGO_FONT_MAP_CLASS
    structure FontMask : PANGO_FONT_MASK
    structure FontMetricsRecord : PANGO_FONT_METRICS_RECORD
    structure FontsetClass : PANGO_FONTSET_CLASS
    structure GlyphItemRecord : PANGO_GLYPH_ITEM_RECORD
    structure GlyphStringRecord : PANGO_GLYPH_STRING_RECORD
    structure GravityHint : PANGO_GRAVITY_HINT
    structure LanguageRecord : PANGO_LANGUAGE_RECORD
    structure LayoutClass : PANGO_LAYOUT_CLASS
    structure LayoutIterRecord : PANGO_LAYOUT_ITER_RECORD
    structure LayoutLineRecord : PANGO_LAYOUT_LINE_RECORD
    structure MatrixRecord : PANGO_MATRIX_RECORD
    structure RectangleRecord : PANGO_RECTANGLE_RECORD
    structure RenderPart : PANGO_RENDER_PART
    structure RendererClass : PANGO_RENDERER_CLASS
    structure Stretch : PANGO_STRETCH
    structure Style : PANGO_STYLE
    structure TabAlign : PANGO_TAB_ALIGN
    structure TabArrayRecord : PANGO_TAB_ARRAY_RECORD
    structure Underline : PANGO_UNDERLINE
    structure Variant : PANGO_VARIANT
    structure Weight : PANGO_WEIGHT
    structure WrapMode : PANGO_WRAP_MODE
    structure AttrList :
      PANGO_ATTR_LIST
        where type record_t = AttrListRecord.t
        where type attributerecord_t = AttributeRecord.t
    structure Attribute :
      PANGO_ATTRIBUTE
        where type record_t = AttributeRecord.t
    structure Color :
      PANGO_COLOR
        where type record_t = ColorRecord.t
    structure Font :
      PANGO_FONT
        where type 'a class_t = 'a FontClass.t
        where type fontdescriptionrecord_t = FontDescriptionRecord.t
        where type 'a fontmapclass_t = 'a FontMapClass.t
        where type rectanglerecord_t = RectangleRecord.t
        where type fontmetricsrecord_t = FontMetricsRecord.t
        where type languagerecord_t = LanguageRecord.t
    structure FontFace :
      PANGO_FONT_FACE
        where type 'a class_t = 'a FontFaceClass.t
        where type fontdescriptionrecord_t = FontDescriptionRecord.t
    structure FontFamily :
      PANGO_FONT_FAMILY
        where type 'a class_t = 'a FontFamilyClass.t
    structure FontMap :
      PANGO_FONT_MAP
        where type 'a class_t = 'a FontMapClass.t
        where type 'a fontclass_t = 'a FontClass.t
        where type 'a fontsetclass_t = 'a FontsetClass.t
        where type languagerecord_t = LanguageRecord.t
        where type fontdescriptionrecord_t = FontDescriptionRecord.t
        where type 'a contextclass_t = 'a ContextClass.t
    structure FontMetrics :
      PANGO_FONT_METRICS
        where type record_t = FontMetricsRecord.t
    structure Fontset :
      PANGO_FONTSET
        where type 'a class_t = 'a FontsetClass.t
        where type 'a fontclass_t = 'a FontClass.t
        where type fontmetricsrecord_t = FontMetricsRecord.t
    structure GlyphItem :
      PANGO_GLYPH_ITEM
        where type record_t = GlyphItemRecord.t
    structure GlyphString :
      PANGO_GLYPH_STRING
        where type record_t = GlyphStringRecord.t
        where type rectanglerecord_t = RectangleRecord.t
        where type 'a fontclass_t = 'a FontClass.t
    structure Layout :
      PANGO_LAYOUT
        where type 'a class_t = 'a LayoutClass.t
        where type attrlistrecord_t = AttrListRecord.t
        where type 'a contextclass_t = 'a ContextClass.t
        where type layoutiterrecord_t = LayoutIterRecord.t
        where type layoutlinerecord_t = LayoutLineRecord.t
        where type rectanglerecord_t = RectangleRecord.t
        where type alignment_t = Alignment.t
        where type ellipsizemode_t = EllipsizeMode.t
        where type fontdescriptionrecord_t = FontDescriptionRecord.t
        where type tabarrayrecord_t = TabArrayRecord.t
        where type wrapmode_t = WrapMode.t
    structure LayoutIter :
      PANGO_LAYOUT_ITER
        where type record_t = LayoutIterRecord.t
        where type 'a layoutclass_t = 'a LayoutClass.t
        where type layoutlinerecord_t = LayoutLineRecord.t
        where type rectanglerecord_t = RectangleRecord.t
        where type glyphitemrecord_t = GlyphItemRecord.t
    structure LayoutLine :
      PANGO_LAYOUT_LINE
        where type record_t = LayoutLineRecord.t
        where type rectanglerecord_t = RectangleRecord.t
    structure Matrix :
      PANGO_MATRIX
        where type record_t = MatrixRecord.t
    structure Rectangle :
      PANGO_RECTANGLE
        where type record_t = RectangleRecord.t
    structure Renderer :
      PANGO_RENDERER
        where type 'a class_t = 'a RendererClass.t
        where type glyphitemrecord_t = GlyphItemRecord.t
        where type glyphstringrecord_t = GlyphStringRecord.t
        where type 'a fontclass_t = 'a FontClass.t
        where type 'a layoutclass_t = 'a LayoutClass.t
        where type layoutlinerecord_t = LayoutLineRecord.t
        where type colorrecord_t = ColorRecord.t
        where type renderpart_t = RenderPart.t
        where type matrixrecord_t = MatrixRecord.t
    structure Script :
      PANGO_SCRIPT
        where type languagerecord_t = LanguageRecord.t
    structure TabArray :
      PANGO_TAB_ARRAY
        where type record_t = TabArrayRecord.t
        where type tabalign_t = TabAlign.t
    structure Gravity :
      PANGO_GRAVITY
        where type matrixrecord_t = MatrixRecord.t
        where type gravityhint_t = GravityHint.t
        where type script_t = Script.t
    structure Language :
      PANGO_LANGUAGE
        where type record_t = LanguageRecord.t
        where type script_t = Script.t
    structure Context :
      PANGO_CONTEXT
        where type 'a class_t = 'a ContextClass.t
        where type fontmetricsrecord_t = FontMetricsRecord.t
        where type 'a fontclass_t = 'a FontClass.t
        where type 'a fontsetclass_t = 'a FontsetClass.t
        where type direction_t = Direction.t
        where type gravity_t = Gravity.t
        where type fontdescriptionrecord_t = FontDescriptionRecord.t
        where type 'a fontmapclass_t = 'a FontMapClass.t
        where type gravityhint_t = GravityHint.t
        where type languagerecord_t = LanguageRecord.t
        where type matrixrecord_t = MatrixRecord.t
    structure FontDescription :
      PANGO_FONT_DESCRIPTION
        where type record_t = FontDescriptionRecord.t
        where type gravity_t = Gravity.t
        where type stretch_t = Stretch.t
        where type style_t = Style.t
        where type variant_t = Variant.t
        where type weight_t = Weight.t
        where type fontmask_t = FontMask.t
    val ANALYSIS_FLAG_CENTERED_BASELINE : LargeInt.int
    val ATTR_INDEX_FROM_TEXT_BEGINNING : LargeInt.int
    val ENGINE_TYPE_LANG : string
    val ENGINE_TYPE_SHAPE : string
    val RENDER_TYPE_NONE : string
    val SCALE : LargeInt.int
    val UNKNOWN_GLYPH_HEIGHT : LargeInt.int
    val UNKNOWN_GLYPH_WIDTH : LargeInt.int
    val attrTypeGetName : AttrType.t -> string
    val attrTypeRegister : string -> AttrType.t
    val bidiTypeForUnichar : char -> BidiType.t
    val extentsToPixels :
      RectangleRecord.t option
       -> RectangleRecord.t option
       -> unit
    val findBaseDir :
      string
       -> LargeInt.int
       -> Direction.t
    val fontDescriptionFromString : string -> FontDescriptionRecord.t
    val gravityGetForMatrix : MatrixRecord.t -> Gravity.t
    val gravityGetForScript :
      Script.t
       -> Gravity.t
       -> GravityHint.t
       -> Gravity.t
    val gravityGetForScriptAndWidth :
      Script.t
       -> bool
       -> Gravity.t
       -> GravityHint.t
       -> Gravity.t
    val gravityToRotation : Gravity.t -> real
    val isZeroWidth : char -> bool
    val languageFromString : string option -> LanguageRecord.t
    val languageGetDefault : unit -> LanguageRecord.t
    val parseMarkup :
      string
       -> LargeInt.int
       -> char
       -> (AttrListRecord.t
            * string
            * char)
            option
    val quantizeLineGeometry :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val scriptForUnichar : char -> Script.t
    val scriptGetSampleLanguage : Script.t -> LanguageRecord.t
    val skipSpace : string -> bool * string
    val trimString : string -> string
    val unicharDirection : char -> Direction.t
    val unitsFromDouble : real -> LargeInt.int
    val unitsToDouble : LargeInt.int -> real
    val version : unit -> LargeInt.int
    val versionCheck :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> string
    val versionString : unit -> string
  end
