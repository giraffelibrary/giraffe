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
    val changed_ = _import "pango_font_map_changed" : PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p -> unit;
    val createContext_ = _import "pango_font_map_create_context" : PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p -> PangoContextClass.FFI.notnull PangoContextClass.FFI.p;
    val getSerial_ = _import "pango_font_map_get_serial" : PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p -> GUInt32.FFI.val_;
    val getShapeEngineType_ = _import "pango_font_map_get_shape_engine_type" : PangoFontMapClass.FFI.notnull PangoFontMapClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
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
               -> unit PangoFontClass.FFI.p;
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
               -> unit PangoFontsetClass.FFI.p;
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
    fun changed self = (PangoFontMapClass.FFI.withPtr ---> I) changed_ self
    fun createContext self = (PangoFontMapClass.FFI.withPtr ---> PangoContextClass.FFI.fromPtr true) createContext_ self
    fun getSerial self = (PangoFontMapClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getSerial_ self
    fun getShapeEngineType self = (PangoFontMapClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getShapeEngineType_ self
    fun listFamilies self =
      let
        val families
         & nFamilies
         & () =
          (
            PangoFontMapClass.FFI.withPtr
             &&&> PangoFontFamilyClassCVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> PangoFontFamilyClassCVectorN.FFI.fromPtr 1
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
         ---> PangoFontClass.FFI.fromOptPtr true
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
         ---> PangoFontsetClass.FFI.fromOptPtr true
      )
        loadFontset_
        (
          self
           & context
           & desc
           & language
        )
  end
