structure Pango : PANGO =
  struct
    local
      open PolyMLFFI
    in
      val attrTypeGetName_ = call (load_sym libpango "pango_attr_type_get_name") (PangoAttrType.PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val attrTypeRegister_ = call (load_sym libpango "pango_attr_type_register") (FFI.PolyML.String.INPTR --> PangoAttrType.PolyML.VAL)
      val bidiTypeForUnichar_ = call (load_sym libpango "pango_bidi_type_for_unichar") (FFI.PolyML.Char.VAL --> PangoBidiType.PolyML.VAL)
      val extentsToPixels_ = call (load_sym libpango "pango_extents_to_pixels") (PangoRectangleRecord.PolyML.OPTPTR &&> PangoRectangleRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val findBaseDir_ = call (load_sym libpango "pango_find_base_dir") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int32.VAL --> PangoDirection.PolyML.VAL)
      val fontDescriptionFromString_ = call (load_sym libpango "pango_font_description_from_string") (FFI.PolyML.String.INPTR --> PangoFontDescriptionRecord.PolyML.PTR)
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
             &&> FFI.PolyML.Bool.VAL
             &&> PangoGravity.PolyML.VAL
             &&> PangoGravityHint.PolyML.VAL
             --> PangoGravity.PolyML.VAL
          )
      val gravityToRotation_ = call (load_sym libpango "pango_gravity_to_rotation") (PangoGravity.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val isZeroWidth_ = call (load_sym libpango "pango_is_zero_width") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val languageFromString_ = call (load_sym libpango "pango_language_from_string") (FFI.PolyML.String.INOPTPTR --> PangoLanguageRecord.PolyML.PTR)
      val languageGetDefault_ = call (load_sym libpango "pango_language_get_default") (FFI.PolyML.VOID --> PangoLanguageRecord.PolyML.PTR)
      val parseMarkup_ =
        call (load_sym libpango "pango_parse_markup")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Char.VAL
             &&> PangoAttrListRecord.PolyML.OUTREF
             &&> FFI.PolyML.String.OUTREF
             &&> FFI.PolyML.Char.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val quantizeLineGeometry_ = call (load_sym libpango "pango_quantize_line_geometry") (FFI.PolyML.Int32.REF &&> FFI.PolyML.Int32.REF --> FFI.PolyML.VOID)
      val scriptForUnichar_ = call (load_sym libpango "pango_script_for_unichar") (FFI.PolyML.Char.VAL --> PangoScript.PolyML.VAL)
      val scriptGetSampleLanguage_ = call (load_sym libpango "pango_script_get_sample_language") (PangoScript.PolyML.VAL --> PangoLanguageRecord.PolyML.PTR)
      val skipSpace_ = call (load_sym libpango "pango_skip_space") (FFI.PolyML.String.INOUTREF --> FFI.PolyML.Bool.VAL)
      val trimString_ = call (load_sym libpango "pango_trim_string") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val unicharDirection_ = call (load_sym libpango "pango_unichar_direction") (FFI.PolyML.Char.VAL --> PangoDirection.PolyML.VAL)
      val unitsFromDouble_ = call (load_sym libpango "pango_units_from_double") (FFI.PolyML.Double.VAL --> FFI.PolyML.Int32.VAL)
      val unitsToDouble_ = call (load_sym libpango "pango_units_to_double") (FFI.PolyML.Int32.VAL --> FFI.PolyML.Double.VAL)
      val version_ = call (load_sym libpango "pango_version") (FFI.PolyML.VOID --> FFI.PolyML.Int32.VAL)
      val versionCheck_ =
        call (load_sym libpango "pango_version_check")
          (
            FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val versionString_ = call (load_sym libpango "pango_version_string") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
    end
    structure Alignment = PangoAlignment
    structure AttrListRecord = PangoAttrListRecord
    structure AttrType = PangoAttrType
    structure AttributeRecord = PangoAttributeRecord
    structure BidiType = PangoBidiType
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
    structure Font = PangoFont
    structure FontFace = PangoFontFace
    structure FontFamily = PangoFontFamily
    structure FontMap = PangoFontMap
    structure FontMetrics = PangoFontMetrics
    structure Fontset = PangoFontset
    structure GlyphItem = PangoGlyphItem
    structure GlyphString = PangoGlyphString
    structure LayoutLine = PangoLayoutLine
    structure Matrix = PangoMatrix
    structure Rectangle = PangoRectangle
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
    fun attrTypeGetName type' = (PangoAttrType.C.withVal ---> FFI.String.fromPtr false) attrTypeGetName_ type'
    fun attrTypeRegister name = (FFI.String.withConstPtr ---> PangoAttrType.C.fromVal) attrTypeRegister_ name
    fun bidiTypeForUnichar ch = (FFI.Char.withVal ---> PangoBidiType.C.fromVal) bidiTypeForUnichar_ ch
    fun extentsToPixels inclusive nearest = (PangoRectangleRecord.C.withOptPtr &&&> PangoRectangleRecord.C.withOptPtr ---> I) extentsToPixels_ (inclusive & nearest)
    fun findBaseDir text length = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> PangoDirection.C.fromVal) findBaseDir_ (text & length)
    fun fontDescriptionFromString str = (FFI.String.withConstPtr ---> PangoFontDescriptionRecord.C.fromPtr true) fontDescriptionFromString_ str
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
         &&&> FFI.Bool.withVal
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
    fun gravityToRotation gravity = (PangoGravity.C.withVal ---> FFI.Double.fromVal) gravityToRotation_ gravity
    fun isZeroWidth ch = (FFI.Char.withVal ---> FFI.Bool.fromVal) isZeroWidth_ ch
    fun languageFromString language = (FFI.String.withConstOptPtr ---> PangoLanguageRecord.C.fromPtr true) languageFromString_ language
    fun languageGetDefault () = (I ---> PangoLanguageRecord.C.fromPtr true) languageGetDefault_ ()
    fun parseMarkup markupText length accelMarker =
      let
        val attrList
         & text
         & accelChar
         & retVal =
          (
            FFI.String.withConstPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Char.withVal
             &&&> PangoAttrListRecord.C.withRefOptPtr
             &&&> FFI.String.withRefConstOptPtr
             &&&> FFI.Char.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> PangoAttrListRecord.C.fromPtr true
                   && FFI.String.fromPtr true
                   && FFI.Char.fromVal
                   && FFI.Bool.fromVal
          )
            parseMarkup_
            (
              markupText
               & length
               & accelMarker
               & NONE
               & NONE
               & #"\^@"
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
            FFI.Int32.withRefVal &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            quantizeLineGeometry_
            (thickness & position)
      in
        (thickness, position)
      end
    fun scriptForUnichar ch = (FFI.Char.withVal ---> PangoScript.C.fromVal) scriptForUnichar_ ch
    fun scriptGetSampleLanguage script = (PangoScript.C.withVal ---> PangoLanguageRecord.C.fromPtr true) scriptGetSampleLanguage_ script
    fun skipSpace pos =
      let
        val pos & retVal = (FFI.String.withRefConstPtr ---> FFI.String.fromPtr true && FFI.Bool.fromVal) skipSpace_ pos
      in
        (retVal, pos)
      end
    fun trimString str = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) trimString_ str
    fun unicharDirection ch = (FFI.Char.withVal ---> PangoDirection.C.fromVal) unicharDirection_ ch
    fun unitsFromDouble d = (FFI.Double.withVal ---> FFI.Int32.fromVal) unitsFromDouble_ d
    fun unitsToDouble i = (FFI.Int32.withVal ---> FFI.Double.fromVal) unitsToDouble_ i
    fun version () = (I ---> FFI.Int32.fromVal) version_ ()
    fun versionCheck requiredMajor requiredMinor requiredMicro =
      (
        FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.String.fromPtr false
      )
        versionCheck_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun versionString () = (I ---> FFI.String.fromPtr false) versionString_ ()
  end
