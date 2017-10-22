structure Pango : PANGO =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    local
      open PolyMLFFI
    in
      val attrTypeGetName_ = call (getSymbol "pango_attr_type_get_name") (PangoAttrType.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val attrTypeRegister_ = call (getSymbol "pango_attr_type_register") (Utf8.PolyML.cInPtr --> PangoAttrType.PolyML.cVal)
      val bidiTypeForUnichar_ = call (getSymbol "pango_bidi_type_for_unichar") (GChar.PolyML.cVal --> PangoBidiType.PolyML.cVal)
      val configKeyGet_ = call (getSymbol "pango_config_key_get") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val configKeyGetSystem_ = call (getSymbol "pango_config_key_get_system") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val extentsToPixels_ = call (getSymbol "pango_extents_to_pixels") (PangoRectangleRecord.PolyML.cOptPtr &&> PangoRectangleRecord.PolyML.cOptPtr --> cVoid)
      val findBaseDir_ = call (getSymbol "pango_find_base_dir") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> PangoDirection.PolyML.cVal)
      val findParagraphBoundary_ =
        call (getSymbol "pango_find_paragraph_boundary")
          (
            Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val fontDescriptionFromString_ = call (getSymbol "pango_font_description_from_string") (Utf8.PolyML.cInPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getLibSubdirectory_ = call (getSymbol "pango_get_lib_subdirectory") (cVoid --> Utf8.PolyML.cOutPtr)
      val getSysconfSubdirectory_ = call (getSymbol "pango_get_sysconf_subdirectory") (cVoid --> Utf8.PolyML.cOutPtr)
      val gravityGetForMatrix_ = call (getSymbol "pango_gravity_get_for_matrix") (PangoMatrixRecord.PolyML.cOptPtr --> PangoGravity.PolyML.cVal)
      val gravityGetForScript_ =
        call (getSymbol "pango_gravity_get_for_script")
          (
            PangoScript.PolyML.cVal
             &&> PangoGravity.PolyML.cVal
             &&> PangoGravityHint.PolyML.cVal
             --> PangoGravity.PolyML.cVal
          )
      val gravityGetForScriptAndWidth_ =
        call (getSymbol "pango_gravity_get_for_script_and_width")
          (
            PangoScript.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> PangoGravity.PolyML.cVal
             &&> PangoGravityHint.PolyML.cVal
             --> PangoGravity.PolyML.cVal
          )
      val gravityToRotation_ = call (getSymbol "pango_gravity_to_rotation") (PangoGravity.PolyML.cVal --> GDouble.PolyML.cVal)
      val isZeroWidth_ = call (getSymbol "pango_is_zero_width") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val languageFromString_ = call (getSymbol "pango_language_from_string") (Utf8.PolyML.cInOptPtr --> PangoLanguageRecord.PolyML.cOptPtr)
      val languageGetDefault_ = call (getSymbol "pango_language_get_default") (cVoid --> PangoLanguageRecord.PolyML.cPtr)
      val lookupAliases_ =
        call (getSymbol "pango_lookup_aliases")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8CVectorN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val markupParserFinish_ =
        call (getSymbol "pango_markup_parser_finish")
          (
            GLibMarkupParseContextRecord.PolyML.cPtr
             &&> PangoAttrListRecord.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             &&> GChar.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val markupParserNew_ = call (getSymbol "pango_markup_parser_new") (GChar.PolyML.cVal --> GLibMarkupParseContextRecord.PolyML.cPtr)
      val parseMarkup_ =
        call (getSymbol "pango_parse_markup")
          (
            Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GChar.PolyML.cVal
             &&> PangoAttrListRecord.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             &&> GChar.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val parseStretch_ =
        call (getSymbol "pango_parse_stretch")
          (
            Utf8.PolyML.cInPtr
             &&> PangoStretch.PolyML.cRef
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val parseStyle_ =
        call (getSymbol "pango_parse_style")
          (
            Utf8.PolyML.cInPtr
             &&> PangoStyle.PolyML.cRef
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val parseVariant_ =
        call (getSymbol "pango_parse_variant")
          (
            Utf8.PolyML.cInPtr
             &&> PangoVariant.PolyML.cRef
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val parseWeight_ =
        call (getSymbol "pango_parse_weight")
          (
            Utf8.PolyML.cInPtr
             &&> PangoWeight.PolyML.cRef
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val quantizeLineGeometry_ = call (getSymbol "pango_quantize_line_geometry") (GInt32.PolyML.cRef &&> GInt32.PolyML.cRef --> cVoid)
      val scriptForUnichar_ = call (getSymbol "pango_script_for_unichar") (GChar.PolyML.cVal --> PangoScript.PolyML.cVal)
      val scriptGetSampleLanguage_ = call (getSymbol "pango_script_get_sample_language") (PangoScript.PolyML.cVal --> PangoLanguageRecord.PolyML.cOptPtr)
      val shapeFull_ =
        call (getSymbol "pango_shape_full")
          (
            Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             &&> PangoAnalysisRecord.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             --> cVoid
          )
      val splitFileList_ = call (getSymbol "pango_split_file_list") (Utf8.PolyML.cInPtr --> Utf8CVector.PolyML.cOutPtr)
      val trimString_ = call (getSymbol "pango_trim_string") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val unicharDirection_ = call (getSymbol "pango_unichar_direction") (GChar.PolyML.cVal --> PangoDirection.PolyML.cVal)
      val unitsFromDouble_ = call (getSymbol "pango_units_from_double") (GDouble.PolyML.cVal --> GInt32.PolyML.cVal)
      val unitsToDouble_ = call (getSymbol "pango_units_to_double") (GInt32.PolyML.cVal --> GDouble.PolyML.cVal)
      val version_ = call (getSymbol "pango_version") (cVoid --> GInt32.PolyML.cVal)
      val versionCheck_ =
        call (getSymbol "pango_version_check")
          (
            GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> Utf8.PolyML.cOutOptPtr
          )
      val versionString_ = call (getSymbol "pango_version_string") (cVoid --> Utf8.PolyML.cOutPtr)
    end
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
    structure FontFamily = PangoFontFamily
    structure FontMap = PangoFontMap
    structure FontMetrics = PangoFontMetrics
    structure Fontset = PangoFontset
    structure FontsetSimpleClass = PangoFontsetSimpleClass
    structure GlyphItem = PangoGlyphItem
    structure GlyphString = PangoGlyphString
    structure Item = PangoItem
    structure Layout = PangoLayout
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
    structure FontsetSimple = PangoFontsetSimple
    structure Gravity = PangoGravity
    structure Language = PangoLanguage
    structure Context = PangoContext
    structure FontDescription = PangoFontDescription
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
    fun attrTypeRegister name = (Utf8.FFI.withPtr ---> PangoAttrType.FFI.fromVal) attrTypeRegister_ name
    fun bidiTypeForUnichar ch = (GChar.FFI.withVal ---> PangoBidiType.FFI.fromVal) bidiTypeForUnichar_ ch
    fun configKeyGet key = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) configKeyGet_ key
    fun configKeyGetSystem key = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) configKeyGetSystem_ key
    fun extentsToPixels (inclusive, nearest) = (PangoRectangleRecord.FFI.withOptPtr &&&> PangoRectangleRecord.FFI.withOptPtr ---> I) extentsToPixels_ (inclusive & nearest)
    fun findBaseDir (text, length) = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> PangoDirection.FFI.fromVal) findBaseDir_ (text & length)
    fun findParagraphBoundary (text, length) =
      let
        val paragraphDelimiterIndex
         & nextParagraphStart
         & () =
          (
            Utf8.FFI.withPtr
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
    fun fontDescriptionFromString str = (Utf8.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) fontDescriptionFromString_ str
    fun getLibSubdirectory () = (I ---> Utf8.FFI.fromPtr 0) getLibSubdirectory_ ()
    fun getSysconfSubdirectory () = (I ---> Utf8.FFI.fromPtr 0) getSysconfSubdirectory_ ()
    fun gravityGetForMatrix matrix = (PangoMatrixRecord.FFI.withOptPtr ---> PangoGravity.FFI.fromVal) gravityGetForMatrix_ matrix
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
    fun languageFromString language = (Utf8.FFI.withOptPtr ---> PangoLanguageRecord.FFI.fromOptPtr false) languageFromString_ language
    fun languageGetDefault () = (I ---> PangoLanguageRecord.FFI.fromPtr false) languageGetDefault_ ()
    fun lookupAliases fontname =
      let
        val families
         & nFamilies
         & () =
          (
            Utf8.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> Utf8CVectorN.FFI.fromPtr 2
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
            GLibMarkupParseContextRecord.FFI.withPtr
             &&&> PangoAttrListRecord.FFI.withRefOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GChar.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> PangoAttrListRecord.FFI.fromPtr true
                   && Utf8.FFI.fromPtr 1
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
            Utf8.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GChar.FFI.withVal
             &&&> PangoAttrListRecord.FFI.withRefOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GChar.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> PangoAttrListRecord.FFI.fromPtr true
                   && Utf8.FFI.fromPtr 1
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
            Utf8.FFI.withPtr
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
            Utf8.FFI.withPtr
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
            Utf8.FFI.withPtr
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
            Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt32.FFI.withVal
         &&&> PangoAnalysisRecord.FFI.withPtr
         &&&> PangoGlyphStringRecord.FFI.withPtr
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
    fun splitFileList str = (Utf8.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) splitFileList_ str
    fun trimString str = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) trimString_ str
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
