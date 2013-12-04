structure Pango : PANGO =
  struct
    local
      open PolyMLFFI
    in
      val attrTypeGetName_ = call (load_sym libpango "pango_attr_type_get_name") (PangoAttrType.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val attrTypeRegister_ = call (load_sym libpango "pango_attr_type_register") (FFI.String.PolyML.INPTR --> PangoAttrType.PolyML.VAL)
      val bidiTypeForUnichar_ = call (load_sym libpango "pango_bidi_type_for_unichar") (FFI.Char.PolyML.VAL --> PangoBidiType.PolyML.VAL)
      val extentsToPixels_ = call (load_sym libpango "pango_extents_to_pixels") (PangoRectangleRecord.PolyML.OPTPTR &&> PangoRectangleRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val findBaseDir_ = call (load_sym libpango "pango_find_base_dir") (FFI.String.PolyML.INPTR &&> FFI.Int.PolyML.VAL --> PangoDirection.PolyML.VAL)
      val fontDescriptionFromString_ = call (load_sym libpango "pango_font_description_from_string") (FFI.String.PolyML.INPTR --> PangoFontDescriptionRecord.PolyML.PTR)
      val gravityGetForMatrix_ = call (load_sym libpango "pango_gravity_get_for_matrix") (PangoMatrixRecord.PolyML.PTR --> PangoGravity.PolyML.VAL)
      val gravityGetForScript_ =
        call (load_sym libpango "pango_gravity_get_for_script")
          (
            PangoScript.PolyML.VAL
             &&> PangoGravity.PolyML.VAL
             &&> PangoGravityHint.PolyML.VAL
             --> PangoGravity.PolyML.VAL
          )
      val gravityGetForScriptAndWidth_ =
        call (load_sym libpango "pango_gravity_get_for_script_and_width")
          (
            PangoScript.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> PangoGravity.PolyML.VAL
             &&> PangoGravityHint.PolyML.VAL
             --> PangoGravity.PolyML.VAL
          )
      val gravityToRotation_ = call (load_sym libpango "pango_gravity_to_rotation") (PangoGravity.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val isZeroWidth_ = call (load_sym libpango "pango_is_zero_width") (FFI.Char.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val languageFromString_ = call (load_sym libpango "pango_language_from_string") (FFI.String.PolyML.INOPTPTR --> PangoLanguageRecord.PolyML.PTR)
      val languageGetDefault_ = call (load_sym libpango "pango_language_get_default") (FFI.PolyML.VOID --> PangoLanguageRecord.PolyML.PTR)
      val parseMarkup_ =
        call (load_sym libpango "pango_parse_markup")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Char.PolyML.VAL
             &&> PangoAttrListRecord.PolyML.OUTREF
             &&> FFI.String.PolyML.OUTREF
             &&> FFI.Char.PolyML.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val quantizeLineGeometry_ = call (load_sym libpango "pango_quantize_line_geometry") (FFI.Int.PolyML.REF &&> FFI.Int.PolyML.REF --> FFI.PolyML.VOID)
      val scriptForUnichar_ = call (load_sym libpango "pango_script_for_unichar") (FFI.Char.PolyML.VAL --> PangoScript.PolyML.VAL)
      val scriptGetSampleLanguage_ = call (load_sym libpango "pango_script_get_sample_language") (PangoScript.PolyML.VAL --> PangoLanguageRecord.PolyML.PTR)
      val skipSpace_ = call (load_sym libpango "pango_skip_space") (FFI.String.PolyML.INOUTREF --> FFI.Bool.PolyML.VAL)
      val trimString_ = call (load_sym libpango "pango_trim_string") (FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val unicharDirection_ = call (load_sym libpango "pango_unichar_direction") (FFI.Char.PolyML.VAL --> PangoDirection.PolyML.VAL)
      val unitsFromDouble_ = call (load_sym libpango "pango_units_from_double") (FFI.Double.PolyML.VAL --> FFI.Int.PolyML.VAL)
      val unitsToDouble_ = call (load_sym libpango "pango_units_to_double") (FFI.Int.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val version_ = call (load_sym libpango "pango_version") (FFI.PolyML.VOID --> FFI.Int.PolyML.VAL)
      val versionCheck_ =
        call (load_sym libpango "pango_version_check")
          (
            FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.String.PolyML.RETPTR
          )
      val versionString_ = call (load_sym libpango "pango_version_string") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
    end
    structure Glyph = PangoGlyph
    structure GlyphUnit = PangoGlyphUnit
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
    structure LayoutRunRecord = PangoLayoutRunRecord
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
    structure LayoutLine = PangoLayoutLine
    structure Matrix = PangoMatrix
    structure Rectangle = PangoRectangle
    structure Renderer = PangoRenderer
    structure Script = PangoScript
    structure TabArray = PangoTabArray
    structure Gravity = PangoGravity
    structure Language = PangoLanguage
    structure LayoutIter = PangoLayoutIter
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
    fun attrTypeGetName type' = (PangoAttrType.C.withVal ---> FFI.String.C.fromPtr false) attrTypeGetName_ type'
    fun attrTypeRegister name = (FFI.String.C.withConstPtr ---> PangoAttrType.C.fromVal) attrTypeRegister_ name
    fun bidiTypeForUnichar ch = (FFI.Char.C.withVal ---> PangoBidiType.C.fromVal) bidiTypeForUnichar_ ch
    fun extentsToPixels inclusive nearest = (PangoRectangleRecord.C.withOptPtr &&&> PangoRectangleRecord.C.withOptPtr ---> I) extentsToPixels_ (inclusive & nearest)
    fun findBaseDir text length = (FFI.String.C.withConstPtr &&&> FFI.Int.C.withVal ---> PangoDirection.C.fromVal) findBaseDir_ (text & length)
    fun fontDescriptionFromString str = (FFI.String.C.withConstPtr ---> PangoFontDescriptionRecord.C.fromPtr true) fontDescriptionFromString_ str
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
    fun languageFromString language = (FFI.String.C.withConstOptPtr ---> PangoLanguageRecord.C.fromPtr true) languageFromString_ language
    fun languageGetDefault () = (I ---> PangoLanguageRecord.C.fromPtr true) languageGetDefault_ ()
    fun parseMarkup markupText length accelMarker =
      let
        val attrList
         & text
         & accelChar
         & retVal =
          (
            FFI.String.C.withConstPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Char.C.withVal
             &&&> PangoAttrListRecord.C.withRefOptPtr
             &&&> FFI.String.C.withRefConstOptPtr
             &&&> FFI.Char.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> PangoAttrListRecord.C.fromPtr true
                   && FFI.String.C.fromPtr true
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
            FFI.Int.C.withRefVal &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
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
        val pos & retVal = (FFI.String.C.withRefConstPtr ---> FFI.String.C.fromPtr true && FFI.Bool.C.fromVal) skipSpace_ pos
      in
        (retVal, pos)
      end
    fun trimString str = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) trimString_ str
    fun unicharDirection ch = (FFI.Char.C.withVal ---> PangoDirection.C.fromVal) unicharDirection_ ch
    fun unitsFromDouble d = (FFI.Double.C.withVal ---> FFI.Int.C.fromVal) unitsFromDouble_ d
    fun unitsToDouble i = (FFI.Int.C.withVal ---> FFI.Double.C.fromVal) unitsToDouble_ i
    fun version () = (I ---> FFI.Int.C.fromVal) version_ ()
    fun versionCheck requiredMajor requiredMinor requiredMicro =
      (
        FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.String.C.fromPtr false
      )
        versionCheck_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun versionString () = (I ---> FFI.String.C.fromPtr false) versionString_ ()
  end
