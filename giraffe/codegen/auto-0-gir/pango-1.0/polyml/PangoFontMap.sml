structure PangoFontMap :>
  PANGO_FONT_MAP
    where type 'a class_t = 'a PangoFontMapClass.t
    where type 'a font_class_t = 'a PangoFontClass.t
    where type 'a fontset_class_t = 'a PangoFontsetClass.t
    where type language_record_t = PangoLanguageRecord.t
    where type font_description_record_t = PangoFontDescriptionRecord.t
    where type 'a context_class_t = 'a PangoContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_map_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val createContext_ = call (load_sym libpango "pango_font_map_create_context") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val loadFont_ =
        call (load_sym libpango "pango_font_map_load_font")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val loadFontset_ =
        call (load_sym libpango "pango_font_map_load_fontset")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> PangoFontDescriptionRecord.PolyML.cPtr
             &&> PangoLanguageRecord.PolyML.cPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
    end
    type 'a class_t = 'a PangoFontMapClass.t
    type 'a font_class_t = 'a PangoFontClass.t
    type 'a fontset_class_t = 'a PangoFontsetClass.t
    type language_record_t = PangoLanguageRecord.t
    type font_description_record_t = PangoFontDescriptionRecord.t
    type 'a context_class_t = 'a PangoContextClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createContext self = (GObjectObjectClass.C.withPtr ---> PangoContextClass.C.fromPtr true) createContext_ self
    fun loadFont self context desc =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> PangoFontDescriptionRecord.C.withPtr
         ---> PangoFontClass.C.fromPtr true
      )
        loadFont_
        (
          self
           & context
           & desc
        )
    fun loadFontset self context desc language =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> PangoFontDescriptionRecord.C.withPtr
         &&&> PangoLanguageRecord.C.withPtr
         ---> PangoFontsetClass.C.fromPtr true
      )
        loadFontset_
        (
          self
           & context
           & desc
           & language
        )
  end
