structure PangoContext :>
  PANGO_CONTEXT
    where type 'a class = 'a PangoContextClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t
    where type 'a font_family_class = 'a PangoFontFamilyClass.class
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
    structure PangoFontFamilyClassCVectorNType =
      CPointerCVectorNType(
        structure CElemType = PangoFontFamilyClass.C.PointerType
        structure Sequence = VectorSequence
      )
    structure PangoFontFamilyClassCVectorN = CVectorN(PangoFontFamilyClassCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_context_new") (cVoid --> PangoContextClass.PolyML.cPtr)
      val getBaseDir_ = call (getSymbol "pango_context_get_base_dir") (PangoContextClass.PolyML.cPtr --> PangoDirection.PolyML.cVal)
      val getBaseGravity_ = call (getSymbol "pango_context_get_base_gravity") (PangoContextClass.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val getFontDescription_ = call (getSymbol "pango_context_get_font_description") (PangoContextClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontMap_ = call (getSymbol "pango_context_get_font_map") (PangoContextClass.PolyML.cPtr --> PangoFontMapClass.PolyML.cPtr)
      val getGravity_ = call (getSymbol "pango_context_get_gravity") (PangoContextClass.PolyML.cPtr --> PangoGravity.PolyML.cVal)
      val getGravityHint_ = call (getSymbol "pango_context_get_gravity_hint") (PangoContextClass.PolyML.cPtr --> PangoGravityHint.PolyML.cVal)
      val getLanguage_ = call (getSymbol "pango_context_get_language") (PangoContextClass.PolyML.cPtr --> PangoLanguageRecord.PolyML.cPtr)
      val getMatrix_ = call (getSymbol "pango_context_get_matrix") (PangoContextClass.PolyML.cPtr --> PangoMatrixRecord.PolyML.cPtr)
      val getMetrics_ =
        call (getSymbol "pango_context_get_metrics")
          (
            PangoContextClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cOptPtr
             &&> PangoLanguageRecord.PolyML.cOptPtr
             --> PangoFontMetricsRecord.PolyML.cPtr
          )
      val listFamilies_ =
        call (getSymbol "pango_context_list_families")
          (
            PangoContextClass.PolyML.cPtr
             &&> PangoFontFamilyClassCVectorN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val loadFont_ = call (getSymbol "pango_context_load_font") (PangoContextClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> PangoFontClass.PolyML.cPtr)
      val loadFontset_ =
        call (getSymbol "pango_context_load_fontset")
          (
            PangoContextClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoLanguageRecord.PolyML.cPtr
             --> PangoFontsetClass.PolyML.cPtr
          )
      val setBaseDir_ = call (getSymbol "pango_context_set_base_dir") (PangoContextClass.PolyML.cPtr &&> PangoDirection.PolyML.cVal --> cVoid)
      val setBaseGravity_ = call (getSymbol "pango_context_set_base_gravity") (PangoContextClass.PolyML.cPtr &&> PangoGravity.PolyML.cVal --> cVoid)
      val setFontDescription_ = call (getSymbol "pango_context_set_font_description") (PangoContextClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> cVoid)
      val setFontMap_ = call (getSymbol "pango_context_set_font_map") (PangoContextClass.PolyML.cPtr &&> PangoFontMapClass.PolyML.cPtr --> cVoid)
      val setGravityHint_ = call (getSymbol "pango_context_set_gravity_hint") (PangoContextClass.PolyML.cPtr &&> PangoGravityHint.PolyML.cVal --> cVoid)
      val setLanguage_ = call (getSymbol "pango_context_set_language") (PangoContextClass.PolyML.cPtr &&> PangoLanguageRecord.PolyML.cPtr --> cVoid)
      val setMatrix_ = call (getSymbol "pango_context_set_matrix") (PangoContextClass.PolyML.cPtr &&> PangoMatrixRecord.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a PangoContextClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type 'a font_family_class = 'a PangoFontFamilyClass.class
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
    fun getBaseDir self = (PangoContextClass.FFI.withPtr ---> PangoDirection.FFI.fromVal) getBaseDir_ self
    fun getBaseGravity self = (PangoContextClass.FFI.withPtr ---> PangoGravity.FFI.fromVal) getBaseGravity_ self
    fun getFontDescription self = (PangoContextClass.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFontDescription_ self
    fun getFontMap self = (PangoContextClass.FFI.withPtr ---> PangoFontMapClass.FFI.fromPtr false) getFontMap_ self
    fun getGravity self = (PangoContextClass.FFI.withPtr ---> PangoGravity.FFI.fromVal) getGravity_ self
    fun getGravityHint self = (PangoContextClass.FFI.withPtr ---> PangoGravityHint.FFI.fromVal) getGravityHint_ self
    fun getLanguage self = (PangoContextClass.FFI.withPtr ---> PangoLanguageRecord.FFI.fromPtr true) getLanguage_ self
    fun getMatrix self = (PangoContextClass.FFI.withPtr ---> PangoMatrixRecord.FFI.fromPtr false) getMatrix_ self
    fun getMetrics self desc language =
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
    fun listFamilies self =
      let
        val families
         & nFamilies
         & () =
          (
            PangoContextClass.FFI.withPtr
             &&&> PangoFontFamilyClassCVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> PangoFontFamilyClassCVectorN.FFI.fromPtr 2
                   && GInt32.FFI.fromVal
                   && I
          )
            listFamilies_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        families (LargeInt.toInt nFamilies)
      end
    fun loadFont self desc = (PangoContextClass.FFI.withPtr &&&> PangoFontDescriptionRecord.FFI.withPtr ---> PangoFontClass.FFI.fromPtr true) loadFont_ (self & desc)
    fun loadFontset self desc language =
      (
        PangoContextClass.FFI.withPtr
         &&&> PangoFontDescriptionRecord.FFI.withPtr
         &&&> PangoLanguageRecord.FFI.withPtr
         ---> PangoFontsetClass.FFI.fromPtr true
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
