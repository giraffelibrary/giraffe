structure Pango : PANGO =
  struct
    local
      open PolyMLFFI
    in
      val attrTypeGetName_ = call (load_sym libpango "pango_attr_type_get_name") (PangoAttrType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val attrTypeRegister_ = call (load_sym libpango "pango_attr_type_register") (Utf8.PolyML.cInPtr --> PangoAttrType.PolyML.cVal)
      val bidiTypeForUnichar_ = call (load_sym libpango "pango_bidi_type_for_unichar") (FFI.Char.PolyML.cVal --> PangoBidiType.PolyML.cVal)
      val extentsToPixels_ = call (load_sym libpango "pango_extents_to_pixels") (PangoRectangleRecord.PolyML.cOptPtr &&> PangoRectangleRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val findBaseDir_ = call (load_sym libpango "pango_find_base_dir") (Utf8.PolyML.cInPtr &&> FFI.Int32.PolyML.cVal --> PangoDirection.PolyML.cVal)
      val fontDescriptionFromString_ = call (load_sym libpango "pango_font_description_from_string") (Utf8.PolyML.cInPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val gravityGetForMatrix_ = call (load_sym libpango "pango_gravity_get_for_matrix") (PangoMatrixRecord.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val gravityGetForScript_ =
        call (load_sym libpango "pango_gravity_get_for_script")
          (
            PangoScript.PolyML.cVal
             &&> PangoGravity.PolyML.cVal
             &&> PangoGravityHint.PolyML.cVal
             --> PangoGravity.PolyML.cVal
          )
      val gravityGetForScriptAndWidth_ =
        call (load_sym libpango "pango_gravity_get_for_script_and_width")
          (
            PangoScript.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> PangoGravity.PolyML.cVal
             &&> PangoGravityHint.PolyML.cVal
             --> PangoGravity.PolyML.cVal
          )
      val gravityToRotation_ = call (load_sym libpango "pango_gravity_to_rotation") (PangoGravity.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val isZeroWidth_ = call (load_sym libpango "pango_is_zero_width") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val languageFromString_ = call (load_sym libpango "pango_language_from_string") (Utf8.PolyML.cInOptPtr --> PangoLanguageRecord.PolyML.cPtr)
      val languageGetDefault_ = call (load_sym libpango "pango_language_get_default") (FFI.PolyML.cVoid --> PangoLanguageRecord.PolyML.cPtr)
      val parseMarkup_ =
        call (load_sym libpango "pango_parse_markup")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Char.PolyML.cVal
             &&> PangoAttrListRecord.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             &&> FFI.Char.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val quantizeLineGeometry_ = call (load_sym libpango "pango_quantize_line_geometry") (FFI.Int32.PolyML.cRef &&> FFI.Int32.PolyML.cRef --> FFI.PolyML.cVoid)
      val scriptForUnichar_ = call (load_sym libpango "pango_script_for_unichar") (FFI.Char.PolyML.cVal --> PangoScript.PolyML.cVal)
      val scriptGetSampleLanguage_ = call (load_sym libpango "pango_script_get_sample_language") (PangoScript.PolyML.cVal --> PangoLanguageRecord.PolyML.cPtr)
      val skipSpace_ = call (load_sym libpango "pango_skip_space") (Utf8.PolyML.cInOutRef --> FFI.Bool.PolyML.cVal)
      val trimString_ = call (load_sym libpango "pango_trim_string") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val unicharDirection_ = call (load_sym libpango "pango_unichar_direction") (FFI.Char.PolyML.cVal --> PangoDirection.PolyML.cVal)
      val unitsFromDouble_ = call (load_sym libpango "pango_units_from_double") (FFI.Double.PolyML.cVal --> FFI.Int32.PolyML.cVal)
      val unitsToDouble_ = call (load_sym libpango "pango_units_to_double") (FFI.Int32.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val version_ = call (load_sym libpango "pango_version") (FFI.PolyML.cVoid --> FFI.Int32.PolyML.cVal)
      val versionCheck_ =
        call (load_sym libpango "pango_version_check")
          (
            FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val versionString_ = call (load_sym libpango "pango_version_string") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
    end
    structure Alignment = PangoAlignment
    structure AttrListRecord = PangoAttrListRecord
    structure AttrType = PangoAttrType
    structure AttributeRecord = PangoAttributeRecord
    structure BidiType = PangoBidiType
    structure ColorRecord = PangoColorRecord
    structure ContextClass = PangoContextClass
    structure CoverageLevel = PangoCoverageLevel
    structure Direction = PangoDirection
    structure EllipsizeMode = PangoEllipsizeMode
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
    structure LanguageRecord = PangoLanguageRecord
    structure LayoutClass = PangoLayoutClass
    structure LayoutIterRecord = PangoLayoutIterRecord
    structure LayoutLineRecord = PangoLayoutLineRecord
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
    structure AttrList = PangoAttrList
    structure Attribute = PangoAttribute
    structure Color = PangoColor
    structure Font = PangoFont
    structure FontFace = PangoFontFace
    structure FontFamily = PangoFontFamily
    structure FontMap = PangoFontMap
    structure FontMetrics = PangoFontMetrics
    structure Fontset = PangoFontset
    structure GlyphItem = PangoGlyphItem
    structure GlyphString = PangoGlyphString
    structure Layout = PangoLayout
    structure LayoutIter = PangoLayoutIter
    structure LayoutLine = PangoLayoutLine
    structure Matrix = PangoMatrix
    structure Rectangle = PangoRectangle
    structure Renderer = PangoRenderer
    structure Script = PangoScript
    structure TabArray = PangoTabArray
    structure Gravity = PangoGravity
    structure Language = PangoLanguage
    structure Context = PangoContext
    structure FontDescription = PangoFontDescription
    val ANALYSIS_FLAG_CENTERED_BASELINE = 1
    val ATTR_INDEX_FROM_TEXT_BEGINNING = 0
    val ENGINE_TYPE_LANG = "PangoEngineLang"
    val ENGINE_TYPE_SHAPE = "PangoEngineShape"
    val RENDER_TYPE_NONE = "PangoRenderNone"
    val SCALE = 1024
    val UNKNOWN_GLYPH_HEIGHT = 14
    val UNKNOWN_GLYPH_WIDTH = 10
    fun attrTypeGetName type' = (PangoAttrType.C.withVal ---> Utf8.C.fromPtr false) attrTypeGetName_ type'
    fun attrTypeRegister name = (Utf8.C.withPtr ---> PangoAttrType.C.fromVal) attrTypeRegister_ name
    fun bidiTypeForUnichar ch = (FFI.Char.C.withVal ---> PangoBidiType.C.fromVal) bidiTypeForUnichar_ ch
    fun extentsToPixels inclusive nearest = (PangoRectangleRecord.C.withOptPtr &&&> PangoRectangleRecord.C.withOptPtr ---> I) extentsToPixels_ (inclusive & nearest)
    fun findBaseDir text length = (Utf8.C.withPtr &&&> FFI.Int32.C.withVal ---> PangoDirection.C.fromVal) findBaseDir_ (text & length)
    fun fontDescriptionFromString str = (Utf8.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) fontDescriptionFromString_ str
    fun gravityGetForMatrix matrix = (PangoMatrixRecord.C.withPtr ---> PangoGravity.C.fromVal) gravityGetForMatrix_ matrix
    fun gravityGetForScript script baseGravity hint =
      (
        PangoScript.C.withVal
         &&&> PangoGravity.C.withVal
         &&&> PangoGravityHint.C.withVal
         ---> PangoGravity.C.fromVal
      )
        gravityGetForScript_
        (
          script
           & baseGravity
           & hint
        )
    fun gravityGetForScriptAndWidth script wide baseGravity hint =
      (
        PangoScript.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> PangoGravity.C.withVal
         &&&> PangoGravityHint.C.withVal
         ---> PangoGravity.C.fromVal
      )
        gravityGetForScriptAndWidth_
        (
          script
           & wide
           & baseGravity
           & hint
        )
    fun gravityToRotation gravity = (PangoGravity.C.withVal ---> FFI.Double.C.fromVal) gravityToRotation_ gravity
    fun isZeroWidth ch = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) isZeroWidth_ ch
    fun languageFromString language = (Utf8.C.withOptPtr ---> PangoLanguageRecord.C.fromPtr true) languageFromString_ language
    fun languageGetDefault () = (I ---> PangoLanguageRecord.C.fromPtr true) languageGetDefault_ ()
    fun parseMarkup markupText length accelMarker =
      let
        val attrList
         & text
         & accelChar
         & retVal =
          (
            Utf8.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Char.C.withVal
             &&&> PangoAttrListRecord.C.withRefOptPtr
             &&&> Utf8.C.withRefOptPtr
             &&&> FFI.Char.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> PangoAttrListRecord.C.fromPtr true
                   && Utf8.C.fromPtr true
                   && FFI.Char.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            parseMarkup_
            (
              markupText
               & length
               & accelMarker
               & NONE
               & NONE
               & FFI.Char.null
               & []
            )
      in
        if retVal
        then
          SOME
            (
              attrList,
              text,
              accelChar
            )
        else NONE
      end
    fun quantizeLineGeometry thickness position =
      let
        val thickness
         & position
         & () =
          (
            FFI.Int32.C.withRefVal &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            quantizeLineGeometry_
            (thickness & position)
      in
        (thickness, position)
      end
    fun scriptForUnichar ch = (FFI.Char.C.withVal ---> PangoScript.C.fromVal) scriptForUnichar_ ch
    fun scriptGetSampleLanguage script = (PangoScript.C.withVal ---> PangoLanguageRecord.C.fromPtr true) scriptGetSampleLanguage_ script
    fun skipSpace pos =
      let
        val pos & retVal = (Utf8.C.withRefPtr ---> Utf8.C.fromPtr true && FFI.Bool.C.fromVal) skipSpace_ pos
      in
        (retVal, pos)
      end
    fun trimString str = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) trimString_ str
    fun unicharDirection ch = (FFI.Char.C.withVal ---> PangoDirection.C.fromVal) unicharDirection_ ch
    fun unitsFromDouble d = (FFI.Double.C.withVal ---> FFI.Int32.C.fromVal) unitsFromDouble_ d
    fun unitsToDouble i = (FFI.Int32.C.withVal ---> FFI.Double.C.fromVal) unitsToDouble_ i
    fun version () = (I ---> FFI.Int32.C.fromVal) version_ ()
    fun versionCheck requiredMajor requiredMinor requiredMicro =
      (
        FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> Utf8.C.fromPtr false
      )
        versionCheck_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun versionString () = (I ---> Utf8.C.fromPtr false) versionString_ ()
  end
