structure PangoContext :>
  PANGO_CONTEXT
    where type 'a class = 'a PangoContextClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t
    where type font_family_class_c_ptr_array_n_t = PangoFontFamilyClassCPtrArrayN.t
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
    val getType_ = _import "pango_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_context_new" : unit -> PangoContextClass.FFI.notnull PangoContextClass.FFI.p;
    val changed_ = _import "pango_context_changed" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> unit;
    val getBaseDir_ = _import "pango_context_get_base_dir" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> PangoDirection.FFI.val_;
    val getBaseGravity_ = _import "pango_context_get_base_gravity" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> PangoGravity.FFI.val_;
    val getFontDescription_ = _import "pango_context_get_font_description" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val getFontMap_ = _import "pango_context_get_font_map" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p;
    val getGravity_ = _import "pango_context_get_gravity" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> PangoGravity.FFI.val_;
    val getGravityHint_ = _import "pango_context_get_gravity_hint" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> PangoGravityHint.FFI.val_;
    val getLanguage_ = _import "pango_context_get_language" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p;
    val getMatrix_ = _import "pango_context_get_matrix" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> unit PangoMatrixRecord.FFI.p;
    val getMetrics_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_context_get_metrics" :
              PangoContextClass.FFI.notnull PangoContextClass.FFI.p
               * unit PangoFontDescriptionRecord.FFI.p
               * unit PangoLanguageRecord.FFI.p
               -> PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getSerial_ = _import "pango_context_get_serial" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> GUInt.FFI.val_;
    val listFamilies_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_context_list_families" :
              PangoContextClass.FFI.notnull PangoContextClass.FFI.p
               * PangoFontFamilyClassCPtrArrayN.MLton.r1
               * (unit, PangoFontFamilyClassCPtrArrayN.FFI.notnull) PangoFontFamilyClassCPtrArrayN.MLton.r2
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadFont_ = fn x1 & x2 => (_import "pango_context_load_font" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p * PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> unit PangoFontClass.FFI.p;) (x1, x2)
    val loadFontset_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_context_load_fontset" :
              PangoContextClass.FFI.notnull PangoContextClass.FFI.p
               * PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               * PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p
               -> unit PangoFontsetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setBaseDir_ = fn x1 & x2 => (_import "pango_context_set_base_dir" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p * PangoDirection.FFI.val_ -> unit;) (x1, x2)
    val setBaseGravity_ = fn x1 & x2 => (_import "pango_context_set_base_gravity" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p * PangoGravity.FFI.val_ -> unit;) (x1, x2)
    val setFontDescription_ = fn x1 & x2 => (_import "pango_context_set_font_description" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p * PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val setFontMap_ = fn x1 & x2 => (_import "pango_context_set_font_map" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p * PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p -> unit;) (x1, x2)
    val setGravityHint_ = fn x1 & x2 => (_import "pango_context_set_gravity_hint" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p * PangoGravityHint.FFI.val_ -> unit;) (x1, x2)
    val setLanguage_ = fn x1 & x2 => (_import "pango_context_set_language" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p * PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p -> unit;) (x1, x2)
    val setMatrix_ = fn x1 & x2 => (_import "pango_context_set_matrix" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p * unit PangoMatrixRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a PangoContextClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type font_family_class_c_ptr_array_n_t = PangoFontFamilyClassCPtrArrayN.t
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoContextClass.FFI.fromPtr true) new_ ()
    fun changed self = (PangoContextClass.FFI.withPtr ---> I) changed_ self
    fun getBaseDir self = (PangoContextClass.FFI.withPtr ---> PangoDirection.FFI.fromVal) getBaseDir_ self
    fun getBaseGravity self = (PangoContextClass.FFI.withPtr ---> PangoGravity.FFI.fromVal) getBaseGravity_ self
    fun getFontDescription self = (PangoContextClass.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFontDescription_ self
    fun getFontMap self = (PangoContextClass.FFI.withPtr ---> PangoFontMapClass.FFI.fromPtr false) getFontMap_ self
    fun getGravity self = (PangoContextClass.FFI.withPtr ---> PangoGravity.FFI.fromVal) getGravity_ self
    fun getGravityHint self = (PangoContextClass.FFI.withPtr ---> PangoGravityHint.FFI.fromVal) getGravityHint_ self
    fun getLanguage self = (PangoContextClass.FFI.withPtr ---> PangoLanguageRecord.FFI.fromPtr true) getLanguage_ self
    fun getMatrix self = (PangoContextClass.FFI.withPtr ---> PangoMatrixRecord.FFI.fromOptPtr false) getMatrix_ self
    fun getMetrics self (desc, language) =
      (
        PangoContextClass.FFI.withPtr
         &&&> PangoFontDescriptionRecord.FFI.withOptPtr
         &&&> PangoLanguageRecord.FFI.withOptPtr
         ---> PangoFontMetricsRecord.FFI.fromPtr true
      )
        getMetrics_
        (
          self
           & desc
           & language
        )
    fun getSerial self = (PangoContextClass.FFI.withPtr ---> GUInt.FFI.fromVal) getSerial_ self
    fun listFamilies self =
      let
        val families
         & nFamilies
         & () =
          (
            PangoContextClass.FFI.withPtr
             &&&> PangoFontFamilyClassCPtrArrayN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> PangoFontFamilyClassCPtrArrayN.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && I
          )
            listFamilies_
            (
              self
               & NONE
               & GInt.null
            )
      in
        families (LargeInt.toInt nFamilies)
      end
    fun loadFont self desc = (PangoContextClass.FFI.withPtr &&&> PangoFontDescriptionRecord.FFI.withPtr ---> PangoFontClass.FFI.fromOptPtr true) loadFont_ (self & desc)
    fun loadFontset self (desc, language) =
      (
        PangoContextClass.FFI.withPtr
         &&&> PangoFontDescriptionRecord.FFI.withPtr
         &&&> PangoLanguageRecord.FFI.withPtr
         ---> PangoFontsetClass.FFI.fromOptPtr true
      )
        loadFontset_
        (
          self
           & desc
           & language
        )
    fun setBaseDir self direction = (PangoContextClass.FFI.withPtr &&&> PangoDirection.FFI.withVal ---> I) setBaseDir_ (self & direction)
    fun setBaseGravity self gravity = (PangoContextClass.FFI.withPtr &&&> PangoGravity.FFI.withVal ---> I) setBaseGravity_ (self & gravity)
    fun setFontDescription self desc = (PangoContextClass.FFI.withPtr &&&> PangoFontDescriptionRecord.FFI.withPtr ---> I) setFontDescription_ (self & desc)
    fun setFontMap self fontMap = (PangoContextClass.FFI.withPtr &&&> PangoFontMapClass.FFI.withPtr ---> I) setFontMap_ (self & fontMap)
    fun setGravityHint self hint = (PangoContextClass.FFI.withPtr &&&> PangoGravityHint.FFI.withVal ---> I) setGravityHint_ (self & hint)
    fun setLanguage self language = (PangoContextClass.FFI.withPtr &&&> PangoLanguageRecord.FFI.withPtr ---> I) setLanguage_ (self & language)
    fun setMatrix self matrix = (PangoContextClass.FFI.withPtr &&&> PangoMatrixRecord.FFI.withOptPtr ---> I) setMatrix_ (self & matrix)
  end
