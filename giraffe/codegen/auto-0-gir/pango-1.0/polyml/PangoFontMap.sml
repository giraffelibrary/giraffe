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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_font_map_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val changed_ = call (getSymbol "pango_font_map_changed") (PangoFontMapClass.PolyML.cPtr --> cVoid)
      val createContext_ = call (getSymbol "pango_font_map_create_context") (PangoFontMapClass.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val getSerial_ = call (getSymbol "pango_font_map_get_serial") (PangoFontMapClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getShapeEngineType_ = call (getSymbol "pango_font_map_get_shape_engine_type") (PangoFontMapClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val listFamilies_ =
        call (getSymbol "pango_font_map_list_families")
          (
            PangoFontMapClass.PolyML.cPtr
             &&> PangoFontFamilyClassCVectorN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val loadFont_ =
        call (getSymbol "pango_font_map_load_font")
          (
            PangoFontMapClass.PolyML.cPtr
             &&> PangoContextClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             --> PangoFontClass.PolyML.cPtr
          )
      val loadFontset_ =
        call (getSymbol "pango_font_map_load_fontset")
          (
            PangoFontMapClass.PolyML.cPtr
             &&> PangoContextClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoLanguageRecord.PolyML.cPtr
             --> PangoFontsetClass.PolyML.cPtr
          )
    end
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
    fun getSerial self = (PangoFontMapClass.FFI.withPtr ---> GUInt.FFI.fromVal) getSerial_ self
    fun getShapeEngineType self = (PangoFontMapClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getShapeEngineType_ self
    fun listFamilies self =
      let
        val families
         & nFamilies
         & () =
          (
            PangoFontMapClass.FFI.withPtr
             &&&> PangoFontFamilyClassCVectorN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> PangoFontFamilyClassCVectorN.FFI.fromPtr 1
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
