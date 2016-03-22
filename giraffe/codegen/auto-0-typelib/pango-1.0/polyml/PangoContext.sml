structure PangoContext :>
  PANGO_CONTEXT
    where type 'a class = 'a PangoContextClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t
    where type 'a font_class = 'a PangoFontClass.class
    where type 'a fontset_class = 'a PangoFontsetClass.class
    where type direction_t = PangoDirection.t
    where type gravity_t = PangoGravity.t
    where type font_description_t = PangoFontDescriptionRecord.t
    where type 'a font_map_class = 'a PangoFontMapClass.class
    where type gravity_hint_t = PangoGravityHint.t
    where type language_t = PangoLanguageRecord.t
    where type matrix_t = PangoMatrixRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libpango "pango_context_new") (FFI.PolyML.cVoid --> PangoContextClass.PolyML.cPtr)
      val getBaseDir_ = call (load_sym libpango "pango_context_get_base_dir") (PangoContextClass.PolyML.cPtr --> PangoDirection.PolyML.cVal)
      val getBaseGravity_ = call (load_sym libpango "pango_context_get_base_gravity") (PangoContextClass.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val getFontDescription_ = call (load_sym libpango "pango_context_get_font_description") (PangoContextClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontMap_ = call (load_sym libpango "pango_context_get_font_map") (PangoContextClass.PolyML.cPtr --> PangoFontMapClass.PolyML.cPtr)
      val getGravity_ = call (load_sym libpango "pango_context_get_gravity") (PangoContextClass.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val getGravityHint_ = call (load_sym libpango "pango_context_get_gravity_hint") (PangoContextClass.PolyML.cPtr --> PangoGravityHint.PolyML.cVal)
      val getLanguage_ = call (load_sym libpango "pango_context_get_language") (PangoContextClass.PolyML.cPtr --> PangoLanguageRecord.PolyML.cPtr)
      val getMatrix_ = call (load_sym libpango "pango_context_get_matrix") (PangoContextClass.PolyML.cPtr --> PangoMatrixRecord.PolyML.cPtr)
      val getMetrics_ =
        call (load_sym libpango "pango_context_get_metrics")
          (
            PangoContextClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cOptPtr
             &&> PangoLanguageRecord.PolyML.cOptPtr
             --> PangoFontMetricsRecord.PolyML.cPtr
          )
      val loadFont_ = call (load_sym libpango "pango_context_load_font") (PangoContextClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontClass.PolyML.cPtr)
      val loadFontset_ =
        call (load_sym libpango "pango_context_load_fontset")
          (
            PangoContextClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoLanguageRecord.PolyML.cPtr
             --> PangoFontsetClass.PolyML.cPtr
          )
      val setBaseDir_ = call (load_sym libpango "pango_context_set_base_dir") (PangoContextClass.PolyML.cPtr &&> PangoDirection.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBaseGravity_ = call (load_sym libpango "pango_context_set_base_gravity") (PangoContextClass.PolyML.cPtr &&> PangoGravity.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFontDescription_ = call (load_sym libpango "pango_context_set_font_description") (PangoContextClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setFontMap_ = call (load_sym libpango "pango_context_set_font_map") (PangoContextClass.PolyML.cPtr &&> PangoFontMapClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setGravityHint_ = call (load_sym libpango "pango_context_set_gravity_hint") (PangoContextClass.PolyML.cPtr &&> PangoGravityHint.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLanguage_ = call (load_sym libpango "pango_context_set_language") (PangoContextClass.PolyML.cPtr &&> PangoLanguageRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setMatrix_ = call (load_sym libpango "pango_context_set_matrix") (PangoContextClass.PolyML.cPtr &&> PangoMatrixRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a PangoContextClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type 'a fontset_class = 'a PangoFontsetClass.class
    type direction_t = PangoDirection.t
    type gravity_t = PangoGravity.t
    type font_description_t = PangoFontDescriptionRecord.t
    type 'a font_map_class = 'a PangoFontMapClass.class
    type gravity_hint_t = PangoGravityHint.t
    type language_t = PangoLanguageRecord.t
    type matrix_t = PangoMatrixRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> PangoContextClass.C.fromPtr true) new_ ()
    fun getBaseDir self = (PangoContextClass.C.withPtr ---> PangoDirection.C.fromVal) getBaseDir_ self
    fun getBaseGravity self = (PangoContextClass.C.withPtr ---> PangoGravity.C.fromVal) getBaseGravity_ self
    fun getFontDescription self = (PangoContextClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFontDescription_ self
    fun getFontMap self = (PangoContextClass.C.withPtr ---> PangoFontMapClass.C.fromPtr false) getFontMap_ self
    fun getGravity self = (PangoContextClass.C.withPtr ---> PangoGravity.C.fromVal) getGravity_ self
    fun getGravityHint self = (PangoContextClass.C.withPtr ---> PangoGravityHint.C.fromVal) getGravityHint_ self
    fun getLanguage self = (PangoContextClass.C.withPtr ---> PangoLanguageRecord.C.fromPtr true) getLanguage_ self
    fun getMatrix self = (PangoContextClass.C.withPtr ---> PangoMatrixRecord.C.fromPtr false) getMatrix_ self
    fun getMetrics self desc language =
      (
        PangoContextClass.C.withPtr
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
    fun loadFont self desc = (PangoContextClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withPtr ---> PangoFontClass.C.fromPtr true) loadFont_ (self & desc)
    fun loadFontset self desc language =
      (
        PangoContextClass.C.withPtr
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
    fun setBaseDir self direction = (PangoContextClass.C.withPtr &&&> PangoDirection.C.withVal ---> I) setBaseDir_ (self & direction)
    fun setBaseGravity self gravity = (PangoContextClass.C.withPtr &&&> PangoGravity.C.withVal ---> I) setBaseGravity_ (self & gravity)
    fun setFontDescription self desc = (PangoContextClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withPtr ---> I) setFontDescription_ (self & desc)
    fun setFontMap self fontMap = (PangoContextClass.C.withPtr &&&> PangoFontMapClass.C.withPtr ---> I) setFontMap_ (self & fontMap)
    fun setGravityHint self hint = (PangoContextClass.C.withPtr &&&> PangoGravityHint.C.withVal ---> I) setGravityHint_ (self & hint)
    fun setLanguage self language = (PangoContextClass.C.withPtr &&&> PangoLanguageRecord.C.withPtr ---> I) setLanguage_ (self & language)
    fun setMatrix self matrix = (PangoContextClass.C.withPtr &&&> PangoMatrixRecord.C.withOptPtr ---> I) setMatrix_ (self & matrix)
  end
