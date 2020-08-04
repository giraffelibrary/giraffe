structure Pango : PANGO =
  struct
    val attrTypeGetName_ = _import "pango_attr_type_get_name" : PangoAttrType.FFI.val_ -> Utf8.FFI.opt Utf8.FFI.out_p;
    val attrTypeRegister_ = _import "mlton_pango_attr_type_register" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> PangoAttrType.FFI.val_;
    val bidiTypeForUnichar_ = _import "pango_bidi_type_for_unichar" : GChar.FFI.val_ -> PangoBidiType.FFI.val_;
    val configKeyGet_ = _import "mlton_pango_config_key_get" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val configKeyGetSystem_ = _import "mlton_pango_config_key_get_system" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val extentsToPixels_ = fn x1 & x2 => (_import "pango_extents_to_pixels" : PangoRectangleRecord.FFI.opt PangoRectangleRecord.FFI.p * PangoRectangleRecord.FFI.opt PangoRectangleRecord.FFI.p -> unit;) (x1, x2)
    val findBaseDir_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_pango_find_base_dir" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> PangoDirection.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val findParagraphBoundary_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_pango_find_paragraph_boundary" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val fontDescriptionFromString_ = _import "mlton_pango_font_description_from_string" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p;
    val getLibSubdirectory_ = _import "pango_get_lib_subdirectory" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getSysconfSubdirectory_ = _import "pango_get_sysconf_subdirectory" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val gravityGetForMatrix_ = _import "pango_gravity_get_for_matrix" : PangoMatrixRecord.FFI.opt PangoMatrixRecord.FFI.p -> PangoGravity.FFI.val_;
    val gravityGetForScript_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_gravity_get_for_script" :
              PangoScript.FFI.val_
               * PangoGravity.FFI.val_
               * PangoGravityHint.FFI.val_
               -> PangoGravity.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val gravityGetForScriptAndWidth_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_gravity_get_for_script_and_width" :
              PangoScript.FFI.val_
               * GBool.FFI.val_
               * PangoGravity.FFI.val_
               * PangoGravityHint.FFI.val_
               -> PangoGravity.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val gravityToRotation_ = _import "pango_gravity_to_rotation" : PangoGravity.FFI.val_ -> GDouble.FFI.val_;
    val isZeroWidth_ = _import "pango_is_zero_width" : GChar.FFI.val_ -> GBool.FFI.val_;
    val languageFromString_ = _import "mlton_pango_language_from_string" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> PangoLanguageRecord.FFI.opt PangoLanguageRecord.FFI.p;
    val languageGetDefault_ = _import "pango_language_get_default" : unit -> PangoLanguageRecord.FFI.non_opt PangoLanguageRecord.FFI.p;
    val lookupAliases_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_pango_lookup_aliases" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8CPtrArrayN.MLton.r1
               * (Utf8CPtrArrayN.FFI.opt, Utf8CPtrArrayN.FFI.non_opt) Utf8CPtrArrayN.MLton.r2
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val markupParserFinish_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_pango_markup_parser_finish" :
              GLibMarkupParseContextRecord.FFI.non_opt GLibMarkupParseContextRecord.FFI.p
               * (PangoAttrListRecord.FFI.opt, PangoAttrListRecord.FFI.non_opt) PangoAttrListRecord.FFI.r
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GChar.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val markupParserNew_ = _import "pango_markup_parser_new" : GChar.FFI.val_ -> GLibMarkupParseContextRecord.FFI.non_opt GLibMarkupParseContextRecord.FFI.p;
    val parseEnum_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & (x6, x7) =>
          (
            _import "mlton_pango_parse_enum" :
              GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt32.FFI.ref_
               * GBool.FFI.val_
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val parseMarkup_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9 =>
          (
            _import "mlton_pango_parse_markup" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * GChar.FFI.val_
               * (PangoAttrListRecord.FFI.opt, PangoAttrListRecord.FFI.non_opt) PangoAttrListRecord.FFI.r
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GChar.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val parseStretch_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_pango_parse_stretch" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * PangoStretch.FFI.ref_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val parseStyle_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_pango_parse_style" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * PangoStyle.FFI.ref_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val parseVariant_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_pango_parse_variant" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * PangoVariant.FFI.ref_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val parseWeight_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_pango_parse_weight" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * PangoWeight.FFI.ref_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val quantizeLineGeometry_ = fn x1 & x2 => (_import "pango_quantize_line_geometry" : GInt32.FFI.ref_ * GInt32.FFI.ref_ -> unit;) (x1, x2)
    val scriptForUnichar_ = _import "pango_script_for_unichar" : GChar.FFI.val_ -> PangoScript.FFI.val_;
    val scriptGetSampleLanguage_ = _import "pango_script_get_sample_language" : PangoScript.FFI.val_ -> PangoLanguageRecord.FFI.opt PangoLanguageRecord.FFI.p;
    val shapeFull_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_pango_shape_full" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * PangoAnalysisRecord.FFI.non_opt PangoAnalysisRecord.FFI.p
               * PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val splitFileList_ = _import "mlton_pango_split_file_list" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val trimString_ = _import "mlton_pango_trim_string" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val unicharDirection_ = _import "pango_unichar_direction" : GChar.FFI.val_ -> PangoDirection.FFI.val_;
    val unitsFromDouble_ = _import "pango_units_from_double" : GDouble.FFI.val_ -> GInt32.FFI.val_;
    val unitsToDouble_ = _import "pango_units_to_double" : GInt32.FFI.val_ -> GDouble.FFI.val_;
    val version_ = _import "pango_version" : unit -> GInt32.FFI.val_;
    val versionCheck_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_version_check" :
              GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> Utf8.FFI.opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val versionString_ = _import "pango_version_string" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    structure Alignment = PangoAlignment
    structure AnalysisRecord = PangoAnalysisRecord
    structure AttrListRecord = PangoAttrListRecord
    structure AttrType = PangoAttrType
    structure AttributeRecord = PangoAttributeRecord
    structure BidiType = PangoBidiType
    structure ColorRecord = PangoColorRecord
    structure ContextClass = PangoContextClass
    structure CoverageLevel = PangoCoverageLevel
    structure Direction = PangoDirection
    structure EllipsizeMode = PangoEllipsizeMode
    structure EngineClass = PangoEngineClass
    structure FontClass = PangoFontClass
    structure FontDescriptionRecord = PangoFontDescriptionRecord
    structure FontFaceClass = PangoFontFaceClass
    structure FontFamilyClass = PangoFontFamilyClass
    structure FontMapClass = PangoFontMapClass
    structure FontMask = PangoFontMask
    structure FontMetricsRecord = PangoFontMetricsRecord
    structure FontsetClass = PangoFontsetClass
    structure GlyphItemRecord = PangoGlyphItemRecord
    structure GlyphStringRecord = PangoGlyphStringRecord
    structure GravityHint = PangoGravityHint
    structure ItemRecord = PangoItemRecord
    structure LanguageRecord = PangoLanguageRecord
    structure LayoutClass = PangoLayoutClass
    structure LayoutIterRecord = PangoLayoutIterRecord
    structure LayoutLineRecord = PangoLayoutLineRecord
    structure LogAttrRecord = PangoLogAttrRecord
    structure MatrixRecord = PangoMatrixRecord
    structure RectangleRecord = PangoRectangleRecord
    structure RenderPart = PangoRenderPart
    structure RendererClass = PangoRendererClass
    structure Stretch = PangoStretch
    structure Style = PangoStyle
    structure TabAlign = PangoTabAlign
    structure TabArrayRecord = PangoTabArrayRecord
    structure Underline = PangoUnderline
    structure Variant = PangoVariant
    structure Weight = PangoWeight
    structure WrapMode = PangoWrapMode
    structure Analysis = PangoAnalysis
    structure AttrList = PangoAttrList
    structure Attribute = PangoAttribute
    structure Color = PangoColor
    structure Engine = PangoEngine
    structure EngineLangClass = PangoEngineLangClass
    structure EngineShapeClass = PangoEngineShapeClass
    structure Font = PangoFont
    structure FontFace = PangoFontFace
    structure FontFaceClassCPtrArrayN = PangoFontFaceClassCPtrArrayN
    structure FontFamilyClassCPtrArrayN = PangoFontFamilyClassCPtrArrayN
    structure FontMetrics = PangoFontMetrics
    structure Fontset = PangoFontset
    structure FontsetSimpleClass = PangoFontsetSimpleClass
    structure GlyphItem = PangoGlyphItem
    structure GlyphString = PangoGlyphString
    structure Item = PangoItem
    structure LogAttrRecordCArrayN = PangoLogAttrRecordCArrayN
    structure LayoutIter = PangoLayoutIter
    structure LayoutLine = PangoLayoutLine
    structure LogAttr = PangoLogAttr
    structure Matrix = PangoMatrix
    structure Rectangle = PangoRectangle
    structure Renderer = PangoRenderer
    structure Script = PangoScript
    structure TabArray = PangoTabArray
    structure EngineLang = PangoEngineLang
    structure EngineShape = PangoEngineShape
    structure FontFamily = PangoFontFamily
    structure FontMap = PangoFontMap
    structure FontsetSimple = PangoFontsetSimple
    structure Gravity = PangoGravity
    structure ScriptCArrayN = PangoScriptCArrayN
    structure Layout = PangoLayout
    structure Context = PangoContext
    structure FontDescription = PangoFontDescription
    structure Language = PangoLanguage
    val ANALYSIS_FLAG_CENTERED_BASELINE = 1
    val ANALYSIS_FLAG_IS_ELLIPSIS = 2
    val ATTR_INDEX_FROM_TEXT_BEGINNING = 0
    val ENGINE_TYPE_LANG = "PangoEngineLang"
    val ENGINE_TYPE_SHAPE = "PangoEngineShape"
    val GLYPH_EMPTY = 268435455
    val GLYPH_INVALID_INPUT = 4294967295
    val GLYPH_UNKNOWN_FLAG = 268435456
    val RENDER_TYPE_NONE = "PangoRenderNone"
    val SCALE = 1024
    val UNKNOWN_GLYPH_HEIGHT = 14
    val UNKNOWN_GLYPH_WIDTH = 10
    val VERSION_MIN_REQUIRED = 2
    fun attrTypeGetName type' = (PangoAttrType.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) attrTypeGetName_ type'
    fun attrTypeRegister name = (Utf8.FFI.withPtr 0 ---> PangoAttrType.FFI.fromVal) attrTypeRegister_ name
    fun bidiTypeForUnichar ch = (GChar.FFI.withVal ---> PangoBidiType.FFI.fromVal) bidiTypeForUnichar_ ch
    fun configKeyGet key = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) configKeyGet_ key
    fun configKeyGetSystem key = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) configKeyGetSystem_ key
    fun extentsToPixels (inclusive, nearest) = (PangoRectangleRecord.FFI.withOptPtr false &&&> PangoRectangleRecord.FFI.withOptPtr false ---> I) extentsToPixels_ (inclusive & nearest)
    fun findBaseDir (text, length) = (Utf8.FFI.withPtr 0 &&&> GInt32.FFI.withVal ---> PangoDirection.FFI.fromVal) findBaseDir_ (text & length)
    fun findParagraphBoundary (text, length) =
      let
        val paragraphDelimiterIndex
         & nextParagraphStart
         & () =
          (
            Utf8.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            findParagraphBoundary_
            (
              text
               & length
               & GInt32.null
               & GInt32.null
            )
      in
        (paragraphDelimiterIndex, nextParagraphStart)
      end
    fun fontDescriptionFromString str = (Utf8.FFI.withPtr 0 ---> PangoFontDescriptionRecord.FFI.fromPtr true) fontDescriptionFromString_ str
    fun getLibSubdirectory () = (I ---> Utf8.FFI.fromPtr 0) getLibSubdirectory_ ()
    fun getSysconfSubdirectory () = (I ---> Utf8.FFI.fromPtr 0) getSysconfSubdirectory_ ()
    fun gravityGetForMatrix matrix = (PangoMatrixRecord.FFI.withOptPtr false ---> PangoGravity.FFI.fromVal) gravityGetForMatrix_ matrix
    fun gravityGetForScript
      (
        script,
        baseGravity,
        hint
      ) =
      (
        PangoScript.FFI.withVal
         &&&> PangoGravity.FFI.withVal
         &&&> PangoGravityHint.FFI.withVal
         ---> PangoGravity.FFI.fromVal
      )
        gravityGetForScript_
        (
          script
           & baseGravity
           & hint
        )
    fun gravityGetForScriptAndWidth
      (
        script,
        wide,
        baseGravity,
        hint
      ) =
      (
        PangoScript.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> PangoGravity.FFI.withVal
         &&&> PangoGravityHint.FFI.withVal
         ---> PangoGravity.FFI.fromVal
      )
        gravityGetForScriptAndWidth_
        (
          script
           & wide
           & baseGravity
           & hint
        )
    fun gravityToRotation gravity = (PangoGravity.FFI.withVal ---> GDouble.FFI.fromVal) gravityToRotation_ gravity
    fun isZeroWidth ch = (GChar.FFI.withVal ---> GBool.FFI.fromVal) isZeroWidth_ ch
    fun languageFromString language = (Utf8.FFI.withOptPtr 0 ---> PangoLanguageRecord.FFI.fromOptPtr false) languageFromString_ language
    fun languageGetDefault () = (I ---> PangoLanguageRecord.FFI.fromPtr false) languageGetDefault_ ()
    fun lookupAliases fontname =
      let
        val families
         & nFamilies
         & () =
          (
            Utf8.FFI.withPtr 0
             &&&> Utf8CPtrArrayN.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> Utf8CPtrArrayN.FFI.fromPtr ~1
                   && GInt32.FFI.fromVal
                   && I
          )
            lookupAliases_
            (
              fontname
               & NONE
               & GInt32.null
            )
      in
        families (LargeInt.toInt nFamilies)
      end
    fun markupParserFinish context =
      let
        val attrList
         & text
         & accelChar
         & () =
          (
            GLibMarkupParseContextRecord.FFI.withPtr false
             &&&> PangoAttrListRecord.FFI.withRefOptPtr true
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GChar.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> PangoAttrListRecord.FFI.fromPtr true
                   && Utf8.FFI.fromPtr ~1
                   && GChar.FFI.fromVal
                   && ignore
          )
            markupParserFinish_
            (
              context
               & NONE
               & NONE
               & GChar.null
               & []
            )
      in
        (
          attrList,
          text,
          accelChar
        )
      end
    fun markupParserNew accelMarker = (GChar.FFI.withVal ---> GLibMarkupParseContextRecord.FFI.fromPtr false) markupParserNew_ accelMarker
    fun parseEnum
      (
        type',
        str,
        warn
      ) =
      let
        val value
         & possibleValues
         & retVal =
          (
            GObjectType.FFI.withVal
             &&&> Utf8.FFI.withOptPtr 0
             &&&> GInt32.FFI.withRefVal
             &&&> GBool.FFI.withVal
             &&&> Utf8.FFI.withRefOptPtr 0
             ---> GInt32.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
                   && GBool.FFI.fromVal
          )
            parseEnum_
            (
              type'
               & str
               & GInt32.null
               & warn
               & NONE
            )
      in
        if retVal then SOME (value, possibleValues) else NONE
      end
    fun parseMarkup
      (
        markupText,
        length,
        accelMarker
      ) =
      let
        val attrList
         & text
         & accelChar
         & () =
          (
            Utf8.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
             &&&> GChar.FFI.withVal
             &&&> PangoAttrListRecord.FFI.withRefOptPtr true
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GChar.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> PangoAttrListRecord.FFI.fromPtr true
                   && Utf8.FFI.fromPtr ~1
                   && GChar.FFI.fromVal
                   && ignore
          )
            parseMarkup_
            (
              markupText
               & length
               & accelMarker
               & NONE
               & NONE
               & GChar.null
               & []
            )
      in
        (
          attrList,
          text,
          accelChar
        )
      end
    fun parseStretch (str, warn) =
      let
        val stretch & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> PangoStretch.FFI.withRefVal
             &&&> GBool.FFI.withVal
             ---> PangoStretch.FFI.fromVal && GBool.FFI.fromVal
          )
            parseStretch_
            (
              str
               & PangoStretch.null
               & warn
            )
      in
        if retVal then SOME stretch else NONE
      end
    fun parseStyle (str, warn) =
      let
        val style & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> PangoStyle.FFI.withRefVal
             &&&> GBool.FFI.withVal
             ---> PangoStyle.FFI.fromVal && GBool.FFI.fromVal
          )
            parseStyle_
            (
              str
               & PangoStyle.null
               & warn
            )
      in
        if retVal then SOME style else NONE
      end
    fun parseVariant (str, warn) =
      let
        val variant & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> PangoVariant.FFI.withRefVal
             &&&> GBool.FFI.withVal
             ---> PangoVariant.FFI.fromVal && GBool.FFI.fromVal
          )
            parseVariant_
            (
              str
               & PangoVariant.null
               & warn
            )
      in
        if retVal then SOME variant else NONE
      end
    fun parseWeight (str, warn) =
      let
        val weight & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> PangoWeight.FFI.withRefVal
             &&&> GBool.FFI.withVal
             ---> PangoWeight.FFI.fromVal && GBool.FFI.fromVal
          )
            parseWeight_
            (
              str
               & PangoWeight.null
               & warn
            )
      in
        if retVal then SOME weight else NONE
      end
    fun quantizeLineGeometry (thickness, position) =
      let
        val thickness
         & position
         & () =
          (
            GInt32.FFI.withRefVal &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            quantizeLineGeometry_
            (thickness & position)
      in
        (thickness, position)
      end
    fun scriptForUnichar ch = (GChar.FFI.withVal ---> PangoScript.FFI.fromVal) scriptForUnichar_ ch
    fun scriptGetSampleLanguage script = (PangoScript.FFI.withVal ---> PangoLanguageRecord.FFI.fromOptPtr true) scriptGetSampleLanguage_ script
    fun shapeFull
      (
        itemText,
        itemLength,
        paragraphText,
        paragraphLength,
        analysis,
        glyphs
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GInt32.FFI.withVal
         &&&> PangoAnalysisRecord.FFI.withPtr false
         &&&> PangoGlyphStringRecord.FFI.withPtr false
         ---> I
      )
        shapeFull_
        (
          itemText
           & itemLength
           & paragraphText
           & paragraphLength
           & analysis
           & glyphs
        )
    fun splitFileList str = (Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) splitFileList_ str
    fun trimString str = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) trimString_ str
    fun unicharDirection ch = (GChar.FFI.withVal ---> PangoDirection.FFI.fromVal) unicharDirection_ ch
    fun unitsFromDouble d = (GDouble.FFI.withVal ---> GInt32.FFI.fromVal) unitsFromDouble_ d
    fun unitsToDouble i = (GInt32.FFI.withVal ---> GDouble.FFI.fromVal) unitsToDouble_ i
    fun version () = (I ---> GInt32.FFI.fromVal) version_ ()
    fun versionCheck
      (
        requiredMajor,
        requiredMinor,
        requiredMicro
      ) =
      (
        GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> Utf8.FFI.fromOptPtr 0
      )
        versionCheck_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun versionString () = (I ---> Utf8.FFI.fromPtr 0) versionString_ ()
  end
