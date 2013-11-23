structure PangoContext :>
  PANGO_CONTEXT
    where type 'a class_t = 'a PangoContextClass.t
    where type fontmetricsrecord_t = PangoFontMetricsRecord.t
    where type 'a fontclass_t = 'a PangoFontClass.t
    where type 'a fontsetclass_t = 'a PangoFontsetClass.t
    where type direction_t = PangoDirection.t
    where type gravity_t = PangoGravity.t
    where type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    where type 'a fontmapclass_t = 'a PangoFontMapClass.t
    where type gravityhint_t = PangoGravityHint.t
    where type languagerecord_t = PangoLanguageRecord.t
    where type matrixrecord_t = PangoMatrixRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libpango "pango_context_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getBaseDir_ = call (load_sym libpango "pango_context_get_base_dir") (GObjectObjectClass.PolyML.PTR --> PangoDirection.PolyML.VAL)
      val getBaseGravity_ = call (load_sym libpango "pango_context_get_base_gravity") (GObjectObjectClass.PolyML.PTR --> PangoGravity.PolyML.VAL)
      val getFontDescription_ = call (load_sym libpango "pango_context_get_font_description") (GObjectObjectClass.PolyML.PTR --> PangoFontDescriptionRecord.PolyML.PTR)
      val getFontMap_ = call (load_sym libpango "pango_context_get_font_map") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getGravity_ = call (load_sym libpango "pango_context_get_gravity") (GObjectObjectClass.PolyML.PTR --> PangoGravity.PolyML.VAL)
      val getGravityHint_ = call (load_sym libpango "pango_context_get_gravity_hint") (GObjectObjectClass.PolyML.PTR --> PangoGravityHint.PolyML.VAL)
      val getLanguage_ = call (load_sym libpango "pango_context_get_language") (GObjectObjectClass.PolyML.PTR --> PangoLanguageRecord.PolyML.PTR)
      val getMatrix_ = call (load_sym libpango "pango_context_get_matrix") (GObjectObjectClass.PolyML.PTR --> PangoMatrixRecord.PolyML.PTR)
      val getMetrics_ =
        call (load_sym libpango "pango_context_get_metrics")
          (
            GObjectObjectClass.PolyML.PTR
             &&> PangoFontDescriptionRecord.PolyML.OPTPTR
             &&> PangoLanguageRecord.PolyML.OPTPTR
             --> PangoFontMetricsRecord.PolyML.PTR
          )
      val loadFont_ = call (load_sym libpango "pango_context_load_font") (GObjectObjectClass.PolyML.PTR &&> PangoFontDescriptionRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val loadFontset_ =
        call (load_sym libpango "pango_context_load_fontset")
          (
            GObjectObjectClass.PolyML.PTR
             &&> PangoFontDescriptionRecord.PolyML.PTR
             &&> PangoLanguageRecord.PolyML.PTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val setBaseDir_ = call (load_sym libpango "pango_context_set_base_dir") (GObjectObjectClass.PolyML.PTR &&> PangoDirection.PolyML.VAL --> FFI.PolyML.VOID)
      val setBaseGravity_ = call (load_sym libpango "pango_context_set_base_gravity") (GObjectObjectClass.PolyML.PTR &&> PangoGravity.PolyML.VAL --> FFI.PolyML.VOID)
      val setFontDescription_ = call (load_sym libpango "pango_context_set_font_description") (GObjectObjectClass.PolyML.PTR &&> PangoFontDescriptionRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setFontMap_ = call (load_sym libpango "pango_context_set_font_map") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setGravityHint_ = call (load_sym libpango "pango_context_set_gravity_hint") (GObjectObjectClass.PolyML.PTR &&> PangoGravityHint.PolyML.VAL --> FFI.PolyML.VOID)
      val setLanguage_ = call (load_sym libpango "pango_context_set_language") (GObjectObjectClass.PolyML.PTR &&> PangoLanguageRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setMatrix_ = call (load_sym libpango "pango_context_set_matrix") (GObjectObjectClass.PolyML.PTR &&> PangoMatrixRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a PangoContextClass.t
    type fontmetricsrecord_t = PangoFontMetricsRecord.t
    type 'a fontclass_t = 'a PangoFontClass.t
    type 'a fontsetclass_t = 'a PangoFontsetClass.t
    type direction_t = PangoDirection.t
    type gravity_t = PangoGravity.t
    type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    type 'a fontmapclass_t = 'a PangoFontMapClass.t
    type gravityhint_t = PangoGravityHint.t
    type languagerecord_t = PangoLanguageRecord.t
    type matrixrecord_t = PangoMatrixRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> PangoContextClass.C.fromPtr true) new_ ()
    fun getBaseDir self = (GObjectObjectClass.C.withPtr ---> PangoDirection.C.fromVal) getBaseDir_ self
    fun getBaseGravity self = (GObjectObjectClass.C.withPtr ---> PangoGravity.C.fromVal) getBaseGravity_ self
    fun getFontDescription self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFontDescription_ self
    fun getFontMap self = (GObjectObjectClass.C.withPtr ---> PangoFontMapClass.C.fromPtr false) getFontMap_ self
    fun getGravity self = (GObjectObjectClass.C.withPtr ---> PangoGravity.C.fromVal) getGravity_ self
    fun getGravityHint self = (GObjectObjectClass.C.withPtr ---> PangoGravityHint.C.fromVal) getGravityHint_ self
    fun getLanguage self = (GObjectObjectClass.C.withPtr ---> PangoLanguageRecord.C.fromPtr true) getLanguage_ self
    fun getMatrix self = (GObjectObjectClass.C.withPtr ---> PangoMatrixRecord.C.fromPtr false) getMatrix_ self
    fun getMetrics self desc language =
      (
        GObjectObjectClass.C.withPtr
         &&&> PangoFontDescriptionRecord.C.withOptPtr
         &&&> PangoLanguageRecord.C.withOptPtr
         ---> PangoFontMetricsRecord.C.fromPtr true
      )
        getMetrics_
        (
          self
           & desc
           & language
        )
    fun loadFont self desc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withPtr ---> PangoFontClass.C.fromPtr true) loadFont_ (self & desc)
    fun loadFontset self desc language =
      (
        GObjectObjectClass.C.withPtr
         &&&> PangoFontDescriptionRecord.C.withPtr
         &&&> PangoLanguageRecord.C.withPtr
         ---> PangoFontsetClass.C.fromPtr true
      )
        loadFontset_
        (
          self
           & desc
           & language
        )
    fun setBaseDir self direction = (GObjectObjectClass.C.withPtr &&&> PangoDirection.C.withVal ---> I) setBaseDir_ (self & direction)
    fun setBaseGravity self gravity = (GObjectObjectClass.C.withPtr &&&> PangoGravity.C.withVal ---> I) setBaseGravity_ (self & gravity)
    fun setFontDescription self desc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withPtr ---> I) setFontDescription_ (self & desc)
    fun setFontMap self fontMap = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFontMap_ (self & fontMap)
    fun setGravityHint self hint = (GObjectObjectClass.C.withPtr &&&> PangoGravityHint.C.withVal ---> I) setGravityHint_ (self & hint)
    fun setLanguage self language = (GObjectObjectClass.C.withPtr &&&> PangoLanguageRecord.C.withPtr ---> I) setLanguage_ (self & language)
    fun setMatrix self matrix = (GObjectObjectClass.C.withPtr &&&> PangoMatrixRecord.C.withOptPtr ---> I) setMatrix_ (self & matrix)
  end
