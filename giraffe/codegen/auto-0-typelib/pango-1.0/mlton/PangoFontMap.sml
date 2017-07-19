structure PangoFontMap :>
  PANGO_FONT_MAP
    where type 'a class = 'a PangoFontMapClass.class
    where type 'a font_family_class = 'a PangoFontFamilyClass.class
    where type 'a font_class = 'a PangoFontClass.class
    where type 'a fontset_class = 'a PangoFontsetClass.class
    where type language_t = PangoLanguageRecord.t
    where type font_description_t = PangoFontDescriptionRecord.t
    where type 'a context_class = 'a PangoContextClass.class =
  struct
    structure PangoFontFamilyClassCVectorNType =
      CPointerCVectorNType(
        structure CElemType = PangoFontFamilyClass.C.PointerType
        structure Sequence = VectorSequence
      )
    structure PangoFontFamilyClassCVectorN = CVectorN(PangoFontFamilyClassCVectorNType)
    val getType_ = _import "pango_font_map_get_type" : unit -> GObjectType.FFI.val_;
    val createContext_ = _import "pango_font_map_create_context" : PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p -> PangoContextClass.FFI.notnull PangoContextClass.FFI.p;
    val listFamilies_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_font_map_list_families" :
              PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p
               * PangoFontFamilyClassCVectorN.MLton.r1
               * (unit, PangoFontFamilyClassCVectorN.FFI.notnull) PangoFontFamilyClassCVectorN.MLton.r2
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadFont_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_font_map_load_font" :
              PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p
               * PangoContextClass.FFI.notnull PangoContextClass.FFI.p
               * PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               -> PangoFontClass.FFI.notnull PangoFontClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val loadFontset_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_font_map_load_fontset" :
              PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p
               * PangoContextClass.FFI.notnull PangoContextClass.FFI.p
               * PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p
               * PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p
               -> PangoFontsetClass.FFI.notnull PangoFontsetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a PangoFontMapClass.class
    type 'a font_family_class = 'a PangoFontFamilyClass.class
    type 'a font_class = 'a PangoFontClass.class
    type 'a fontset_class = 'a PangoFontsetClass.class
    type language_t = PangoLanguageRecord.t
    type font_description_t = PangoFontDescriptionRecord.t
    type 'a context_class = 'a PangoContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createContext self = (PangoFontMapClass.FFI.withPtr ---> PangoContextClass.FFI.fromPtr true) createContext_ self
    fun listFamilies self =
      let
        val families
         & nFamilies
         & () =
          (
            PangoFontMapClass.FFI.withPtr
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
    fun loadFont self (context, desc) =
      (
        PangoFontMapClass.FFI.withPtr
         &&&> PangoContextClass.FFI.withPtr
         &&&> PangoFontDescriptionRecord.FFI.withPtr
         ---> PangoFontClass.FFI.fromPtr true
      )
        loadFont_
        (
          self
           & context
           & desc
        )
    fun loadFontset
      self
      (
        context,
        desc,
        language
      ) =
      (
        PangoFontMapClass.FFI.withPtr
         &&&> PangoContextClass.FFI.withPtr
         &&&> PangoFontDescriptionRecord.FFI.withPtr
         &&&> PangoLanguageRecord.FFI.withPtr
         ---> PangoFontsetClass.FFI.fromPtr true
      )
        loadFontset_
        (
          self
           & context
           & desc
           & language
        )
  end
