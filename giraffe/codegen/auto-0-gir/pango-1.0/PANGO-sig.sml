signature PANGO =
  sig
    structure Glyph : PANGO_GLYPH
    structure GlyphUnit : PANGO_GLYPH_UNIT
    structure Alignment : PANGO_ALIGNMENT
    structure AnalysisRecord : PANGO_ANALYSIS_RECORD
    structure AttrListRecord : PANGO_ATTR_LIST_RECORD
    structure AttrType : PANGO_ATTR_TYPE
    structure AttributeRecord : PANGO_ATTRIBUTE_RECORD
    structure BidiType : PANGO_BIDI_TYPE
    structure ColorRecord : PANGO_COLOR_RECORD
    structure ContextClass : PANGO_CONTEXT_CLASS
    structure CoverageLevel : PANGO_COVERAGE_LEVEL
    structure Direction : PANGO_DIRECTION
    structure EllipsizeMode : PANGO_ELLIPSIZE_MODE
    structure EngineClass : PANGO_ENGINE_CLASS
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
    structure ItemRecord : PANGO_ITEM_RECORD
    structure LanguageRecord : PANGO_LANGUAGE_RECORD
    structure LayoutClass : PANGO_LAYOUT_CLASS
    structure LayoutIterRecord : PANGO_LAYOUT_ITER_RECORD
    structure LayoutLineRecord : PANGO_LAYOUT_LINE_RECORD
    structure LogAttrRecord : PANGO_LOG_ATTR_RECORD
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
    structure LayoutRunRecord : PANGO_LAYOUT_RUN_RECORD
    structure Analysis :
      PANGO_ANALYSIS
        where type t = AnalysisRecord.t
    structure AttrList :
      PANGO_ATTR_LIST
        where type t = AttrListRecord.t
    structure Attribute :
      PANGO_ATTRIBUTE
        where type t = AttributeRecord.t
    structure Color :
      PANGO_COLOR
        where type t = ColorRecord.t
    structure Engine :
      PANGO_ENGINE
        where type 'a class = 'a EngineClass.class
    structure EngineLangClass :
      PANGO_ENGINE_LANG_CLASS
        where type 'a engine_class = 'a EngineClass.class
    structure EngineShapeClass :
      PANGO_ENGINE_SHAPE_CLASS
        where type 'a engine_class = 'a EngineClass.class
    structure Font :
      PANGO_FONT
        where type 'a class = 'a FontClass.class
        where type font_description_t = FontDescriptionRecord.t
        where type 'a font_map_class = 'a FontMapClass.class
        where type rectangle_t = RectangleRecord.t
        where type glyph_t = Glyph.t
        where type font_metrics_t = FontMetricsRecord.t
        where type language_t = LanguageRecord.t
    structure FontFace :
      PANGO_FONT_FACE
        where type 'a class = 'a FontFaceClass.class
        where type font_description_t = FontDescriptionRecord.t
    structure FontFamily :
      PANGO_FONT_FAMILY
        where type 'a class = 'a FontFamilyClass.class
        where type 'a font_face_class = 'a FontFaceClass.class
    structure FontMap :
      PANGO_FONT_MAP
        where type 'a class = 'a FontMapClass.class
        where type 'a font_family_class = 'a FontFamilyClass.class
        where type 'a font_class = 'a FontClass.class
        where type 'a fontset_class = 'a FontsetClass.class
        where type language_t = LanguageRecord.t
        where type font_description_t = FontDescriptionRecord.t
        where type 'a context_class = 'a ContextClass.class
    structure FontMetrics :
      PANGO_FONT_METRICS
        where type t = FontMetricsRecord.t
    structure Fontset :
      PANGO_FONTSET
        where type 'a class = 'a FontsetClass.class
        where type 'a font_class = 'a FontClass.class
        where type font_metrics_t = FontMetricsRecord.t
    structure FontsetSimpleClass :
      PANGO_FONTSET_SIMPLE_CLASS
        where type 'a fontset_class = 'a FontsetClass.class
    structure GlyphItem :
      PANGO_GLYPH_ITEM
        where type t = GlyphItemRecord.t
    structure GlyphString :
      PANGO_GLYPH_STRING
        where type t = GlyphStringRecord.t
        where type rectangle_t = RectangleRecord.t
        where type 'a font_class = 'a FontClass.class
        where type analysis_t = AnalysisRecord.t
    structure Item :
      PANGO_ITEM
        where type t = ItemRecord.t
    structure Layout :
      PANGO_LAYOUT
        where type 'a class = 'a LayoutClass.class
        where type 'a context_class = 'a ContextClass.class
        where type layout_iter_t = LayoutIterRecord.t
        where type layout_line_t = LayoutLineRecord.t
        where type log_attr_t = LogAttrRecord.t
        where type rectangle_t = RectangleRecord.t
        where type alignment_t = Alignment.t
        where type attr_list_t = AttrListRecord.t
        where type ellipsize_mode_t = EllipsizeMode.t
        where type font_description_t = FontDescriptionRecord.t
        where type tab_array_t = TabArrayRecord.t
        where type wrap_mode_t = WrapMode.t
    structure LayoutLine :
      PANGO_LAYOUT_LINE
        where type t = LayoutLineRecord.t
        where type rectangle_t = RectangleRecord.t
    structure LogAttr :
      PANGO_LOG_ATTR
        where type t = LogAttrRecord.t
    structure Matrix :
      PANGO_MATRIX
        where type t = MatrixRecord.t
    structure Rectangle :
      PANGO_RECTANGLE
        where type t = RectangleRecord.t
    structure Renderer :
      PANGO_RENDERER
        where type 'a class = 'a RendererClass.class
        where type glyph_t = Glyph.t
        where type glyph_item_t = GlyphItemRecord.t
        where type glyph_string_t = GlyphStringRecord.t
        where type 'a font_class = 'a FontClass.class
        where type 'a layout_class = 'a LayoutClass.class
        where type layout_line_t = LayoutLineRecord.t
        where type color_t = ColorRecord.t
        where type render_part_t = RenderPart.t
        where type matrix_t = MatrixRecord.t
    structure Script :
      PANGO_SCRIPT
        where type language_t = LanguageRecord.t
    structure TabArray :
      PANGO_TAB_ARRAY
        where type t = TabArrayRecord.t
        where type tab_align_t = TabAlign.t
    structure EngineLang :
      PANGO_ENGINE_LANG
        where type 'a class = 'a EngineLangClass.class
    structure EngineShape :
      PANGO_ENGINE_SHAPE
        where type 'a class = 'a EngineShapeClass.class
    structure FontsetSimple :
      PANGO_FONTSET_SIMPLE
        where type 'a class = 'a FontsetSimpleClass.class
        where type language_t = LanguageRecord.t
        where type 'a font_class = 'a FontClass.class
    structure Gravity :
      PANGO_GRAVITY
        where type matrix_t = MatrixRecord.t
        where type gravity_hint_t = GravityHint.t
        where type script_t = Script.t
    structure Language :
      PANGO_LANGUAGE
        where type t = LanguageRecord.t
        where type script_t = Script.t
    structure LayoutIter :
      PANGO_LAYOUT_ITER
        where type t = LayoutIterRecord.t
        where type 'a layout_class = 'a LayoutClass.class
        where type layout_line_t = LayoutLineRecord.t
        where type rectangle_t = RectangleRecord.t
        where type layout_run_t = LayoutRunRecord.t
    structure Context :
      PANGO_CONTEXT
        where type 'a class = 'a ContextClass.class
        where type font_metrics_t = FontMetricsRecord.t
        where type 'a font_family_class = 'a FontFamilyClass.class
        where type 'a font_class = 'a FontClass.class
        where type 'a fontset_class = 'a FontsetClass.class
        where type direction_t = Direction.t
        where type gravity_t = Gravity.t
        where type font_description_t = FontDescriptionRecord.t
        where type 'a font_map_class = 'a FontMapClass.class
        where type gravity_hint_t = GravityHint.t
        where type language_t = LanguageRecord.t
        where type matrix_t = MatrixRecord.t
    structure FontDescription :
      PANGO_FONT_DESCRIPTION
        where type t = FontDescriptionRecord.t
        where type gravity_t = Gravity.t
        where type stretch_t = Stretch.t
        where type style_t = Style.t
        where type variant_t = Variant.t
        where type weight_t = Weight.t
        where type font_mask_t = FontMask.t
    val ANALYSIS_FLAG_CENTERED_BASELINE : LargeInt.int
    val ANALYSIS_FLAG_IS_ELLIPSIS : LargeInt.int
    val ATTR_INDEX_FROM_TEXT_BEGINNING : LargeInt.int
    val ENGINE_TYPE_LANG : string
    val ENGINE_TYPE_SHAPE : string
    val RENDER_TYPE_NONE : string
    val SCALE : LargeInt.int
    val UNKNOWN_GLYPH_HEIGHT : LargeInt.int
    val UNKNOWN_GLYPH_WIDTH : LargeInt.int
    val VERSION_MIN_REQUIRED : LargeInt.int
    val configKeyGet : string -> string
    val configKeyGetSystem : string -> string
    val extentsToPixels : RectangleRecord.t option * RectangleRecord.t option -> unit
    val findBaseDir : string * LargeInt.int -> Direction.t
    val findParagraphBoundary : string * LargeInt.int -> LargeInt.int * LargeInt.int
    val getLibSubdirectory : unit -> string
    val getSysconfSubdirectory : unit -> string
    val isZeroWidth : char -> bool
    val lookupAliases : string -> string list
    val markupParserFinish :
      GLib.MarkupParseContextRecord.t
       -> AttrListRecord.t
           * string
           * char
    val markupParserNew : char -> GLib.MarkupParseContextRecord.t
    val parseEnum :
      GObject.Type.t
       * string option
       * bool
       -> (LargeInt.int * string) option
    val parseMarkup :
      string
       * LargeInt.int
       * char
       -> AttrListRecord.t
           * string
           * char
    val parseStretch : string * bool -> Stretch.t option
    val parseStyle : string * bool -> Style.t option
    val parseVariant : string * bool -> Variant.t option
    val parseWeight : string * bool -> Weight.t option
    val quantizeLineGeometry : LargeInt.int * LargeInt.int -> LargeInt.int * LargeInt.int
    val shapeFull :
      string
       * LargeInt.int
       * string option
       * LargeInt.int
       * AnalysisRecord.t
       * GlyphStringRecord.t
       -> unit
    val splitFileList : string -> string list
    val trimString : string -> string
    val unicharDirection : char -> Direction.t
    val unitsFromDouble : real -> LargeInt.int
    val unitsToDouble : LargeInt.int -> real
    val version : unit -> LargeInt.int
    val versionCheck :
      LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> string option
    val versionString : unit -> string
  end
