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
    val getType_ = _import "pango_context_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "pango_context_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBaseDir_ = _import "pango_context_get_base_dir" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoDirection.C.val_;
    val getBaseGravity_ = _import "pango_context_get_base_gravity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoGravity.C.val_;
    val getFontDescription_ = _import "pango_context_get_font_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getFontMap_ = _import "pango_context_get_font_map" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getGravity_ = _import "pango_context_get_gravity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoGravity.C.val_;
    val getGravityHint_ = _import "pango_context_get_gravity_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoGravityHint.C.val_;
    val getLanguage_ = _import "pango_context_get_language" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p;
    val getMatrix_ = _import "pango_context_get_matrix" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p;
    val getMetrics_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_context_get_metrics" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit PangoFontDescriptionRecord.C.p
               * unit PangoLanguageRecord.C.p
               -> PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val loadFont_ = fn x1 & x2 => (_import "pango_context_load_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val loadFontset_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_context_load_fontset" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               * PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setBaseDir_ = fn x1 & x2 => (_import "pango_context_set_base_dir" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoDirection.C.val_ -> unit;) (x1, x2)
    val setBaseGravity_ = fn x1 & x2 => (_import "pango_context_set_base_gravity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoGravity.C.val_ -> unit;) (x1, x2)
    val setFontDescription_ = fn x1 & x2 => (_import "pango_context_set_font_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val setFontMap_ = fn x1 & x2 => (_import "pango_context_set_font_map" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setGravityHint_ = fn x1 & x2 => (_import "pango_context_set_gravity_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoGravityHint.C.val_ -> unit;) (x1, x2)
    val setLanguage_ = fn x1 & x2 => (_import "pango_context_set_language" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p -> unit;) (x1, x2)
    val setMatrix_ = fn x1 & x2 => (_import "pango_context_set_matrix" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit PangoMatrixRecord.C.p -> unit;) (x1, x2)
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
