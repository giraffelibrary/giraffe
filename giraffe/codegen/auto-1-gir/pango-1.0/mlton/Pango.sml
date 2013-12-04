structure Pango : PANGO =
  struct
    val attrTypeGetName_ = _import "pango_attr_type_get_name" : PangoAttrType.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val attrTypeRegister_ = _import "mlton_pango_attr_type_register" : cstring * unit CPointer.t -> PangoAttrType.C.val_;
    val bidiTypeForUnichar_ = _import "pango_bidi_type_for_unichar" : FFI.Char.C.val_ -> PangoBidiType.C.val_;
    val extentsToPixels_ = fn x1 & x2 => (_import "pango_extents_to_pixels" : unit PangoRectangleRecord.C.p * unit PangoRectangleRecord.C.p -> unit;) (x1, x2)
    val findBaseDir_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_pango_find_base_dir" :
              cstring
               * unit CPointer.t
               * FFI.Int.C.val_
               -> PangoDirection.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val fontDescriptionFromString_ = _import "mlton_pango_font_description_from_string" : cstring * unit CPointer.t -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val gravityGetForMatrix_ = _import "pango_gravity_get_for_matrix" : PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p -> PangoGravity.C.val_;
    val gravityGetForScript_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_gravity_get_for_script" :
              PangoScript.C.val_
               * PangoGravity.C.val_
               * PangoGravityHint.C.val_
               -> PangoGravity.C.val_;
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
              PangoScript.C.val_
               * FFI.Bool.C.val_
               * PangoGravity.C.val_
               * PangoGravityHint.C.val_
               -> PangoGravity.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val gravityToRotation_ = _import "pango_gravity_to_rotation" : PangoGravity.C.val_ -> FFI.Double.C.val_;
    val isZeroWidth_ = _import "pango_is_zero_width" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val languageFromString_ = _import "mlton_pango_language_from_string" : cstring * unit CPointer.t -> PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p;
    val languageGetDefault_ = _import "pango_language_get_default" : unit -> PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p;
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
              cstring
               * unit CPointer.t
               * FFI.Int.C.val_
               * FFI.Char.C.val_
               * (unit, PangoAttrListRecord.C.notnull) PangoAttrListRecord.C.r
               * cstring
               * unit CPointer.t ref
               * FFI.Char.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
    val quantizeLineGeometry_ = fn x1 & x2 => (_import "pango_quantize_line_geometry" : FFI.Int.C.ref_ * FFI.Int.C.ref_ -> unit;) (x1, x2)
    val scriptForUnichar_ = _import "pango_script_for_unichar" : FFI.Char.C.val_ -> PangoScript.C.val_;
    val scriptGetSampleLanguage_ = _import "pango_script_get_sample_language" : PangoScript.C.val_ -> PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p;
    val skipSpace_ = _import "mlton_pango_skip_space" : cstring * unit CPointer.t ref -> FFI.Bool.C.val_;
    val trimString_ = _import "mlton_pango_trim_string" : cstring * unit CPointer.t -> FFI.String.C.notnull FFI.String.C.out_p;
    val unicharDirection_ = _import "pango_unichar_direction" : FFI.Char.C.val_ -> PangoDirection.C.val_;
    val unitsFromDouble_ = _import "pango_units_from_double" : FFI.Double.C.val_ -> FFI.Int.C.val_;
    val unitsToDouble_ = _import "pango_units_to_double" : FFI.Int.C.val_ -> FFI.Double.C.val_;
    val version_ = _import "pango_version" : unit -> FFI.Int.C.val_;
    val versionCheck_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_version_check" :
              FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val versionString_ = _import "pango_version_string" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
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
