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
      val configKeyGet_ = call (getSymbol "pango_config_key_get") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val configKeyGetSystem_ = call (getSymbol "pango_config_key_get_system") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val extentsToPixels_ = call (getSymbol "pango_extents_to_pixels") (PangoRectangleRecord.PolyML.cOptPtr &&> PangoRectangleRecord.PolyML.cOptPtr --> cVoid)
      val findBaseDir_ = call (getSymbol "pango_find_base_dir") (Utf8.PolyML.cInPtr &&> GInt.PolyML.cVal --> PangoDirection.PolyML.cVal)
      val findParagraphBoundary_ =
        call (getSymbol "pango_find_paragraph_boundary")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getLibSubdirectory_ = call (getSymbol "pango_get_lib_subdirectory") (cVoid --> Utf8.PolyML.cOutPtr)
      val getSysconfSubdirectory_ = call (getSymbol "pango_get_sysconf_subdirectory") (cVoid --> Utf8.PolyML.cOutPtr)
      val isZeroWidth_ = call (getSymbol "pango_is_zero_width") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val lookupAliases_ =
        call (getSymbol "pango_lookup_aliases")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8CVectorN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
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
             &&> GInt.PolyML.cVal
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
      val quantizeLineGeometry_ = call (getSymbol "pango_quantize_line_geometry") (GInt.PolyML.cRef &&> GInt.PolyML.cRef --> cVoid)
      val shapeFull_ =
        call (getSymbol "pango_shape_full")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt.PolyML.cVal
             &&> PangoAnalysisRecord.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             --> cVoid
          )
      val splitFileList_ = call (getSymbol "pango_split_file_list") (Utf8.PolyML.cInPtr --> Utf8CVector.PolyML.cOutPtr)
      val trimString_ = call (getSymbol "pango_trim_string") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val unicharDirection_ = call (getSymbol "pango_unichar_direction") (GChar.PolyML.cVal --> PangoDirection.PolyML.cVal)
      val unitsFromDouble_ = call (getSymbol "pango_units_from_double") (GDouble.PolyML.cVal --> GInt.PolyML.cVal)
      val unitsToDouble_ = call (getSymbol "pango_units_to_double") (GInt.PolyML.cVal --> GDouble.PolyML.cVal)
      val version_ = call (getSymbol "pango_version") (cVoid --> GInt.PolyML.cVal)
      val versionCheck_ =
        call (getSymbol "pango_version_check")
          (
            GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val versionString_ = call (getSymbol "pango_version_string") (cVoid --> Utf8.PolyML.cOutPtr)
    end
    structure Glyph = PangoGlyph
    structure GlyphUnit = PangoGlyphUnit
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
    structure LayoutRunRecord = PangoLayoutRunRecord
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
    structure LayoutIter = PangoLayoutIter
    structure Context = PangoContext
    structure FontDescription = PangoFontDescription
    val ANALYSIS_FLAG_CENTERED_BASELINE = 1
    val ANALYSIS_FLAG_IS_ELLIPSIS = 2
    val ATTR_INDEX_FROM_TEXT_BEGINNING = 0
    val ENGINE_TYPE_LANG = "PangoEngineLang"
    val ENGINE_TYPE_SHAPE = "PangoEngineShape"
    val RENDER_TYPE_NONE = "PangoRenderNone"
    val SCALE = 1024
    val UNKNOWN_GLYPH_HEIGHT = 14
    val UNKNOWN_GLYPH_WIDTH = 10
    val VERSION_MIN_REQUIRED = 2
    fun configKeyGet key = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) configKeyGet_ key
    fun configKeyGetSystem key = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) configKeyGetSystem_ key
    fun extentsToPixels (inclusive, nearest) = (PangoRectangleRecord.FFI.withOptPtr &&&> PangoRectangleRecord.FFI.withOptPtr ---> I) extentsToPixels_ (inclusive & nearest)
    fun findBaseDir (text, length) = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> PangoDirection.FFI.fromVal) findBaseDir_ (text & length)
    fun findParagraphBoundary (text, length) =
      let
        val paragraphDelimiterIndex
         & nextParagraphStart
         & () =
          (
            Utf8.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            findParagraphBoundary_
            (
              text
               & length
               & GInt.null
               & GInt.null
            )
      in
        (paragraphDelimiterIndex, nextParagraphStart)
      end
    fun getLibSubdirectory () = (I ---> Utf8.FFI.fromPtr 0) getLibSubdirectory_ ()
    fun getSysconfSubdirectory () = (I ---> Utf8.FFI.fromPtr 0) getSysconfSubdirectory_ ()
    fun isZeroWidth ch = (GChar.FFI.withVal ---> GBool.FFI.fromVal) isZeroWidth_ ch
    fun lookupAliases fontname =
      let
        val families
         & nFamilies
         & () =
          (
            Utf8.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> Utf8CVectorN.FFI.fromPtr 2
                   && GInt.FFI.fromVal
                   && I
          )
            lookupAliases_
            (
              fontname
               & NONE
               & GInt.null
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
             &&&> GInt.FFI.withVal
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
            GInt.FFI.withRefVal &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            quantizeLineGeometry_
            (thickness & position)
      in
        (thickness, position)
      end
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
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt.FFI.withVal
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
    fun unitsFromDouble d = (GDouble.FFI.withVal ---> GInt.FFI.fromVal) unitsFromDouble_ d
    fun unitsToDouble i = (GInt.FFI.withVal ---> GDouble.FFI.fromVal) unitsToDouble_ i
    fun version () = (I ---> GInt.FFI.fromVal) version_ ()
    fun versionCheck
      (
        requiredMajor,
        requiredMinor,
        requiredMicro
      ) =
      (
        GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        versionCheck_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun versionString () = (I ---> Utf8.FFI.fromPtr 0) versionString_ ()
  end
