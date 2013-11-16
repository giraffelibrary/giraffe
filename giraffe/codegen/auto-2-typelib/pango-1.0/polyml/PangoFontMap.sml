structure PangoFontMap :>
  PANGO_FONT_MAP
    where type 'a class_t = 'a PangoFontMapClass.t
    where type 'a fontclass_t = 'a PangoFontClass.t
    where type 'a fontsetclass_t = 'a PangoFontsetClass.t
    where type languagerecord_t = PangoLanguageRecord.t
    where type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    where type 'a contextclass_t = 'a PangoContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_map_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val createContext_ = call (load_sym libpango "pango_font_map_create_context") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val loadFont_ =
        call (load_sym libpango "pango_font_map_load_font")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> PangoFontDescriptionRecord.PolyML.PTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val loadFontset_ =
        call (load_sym libpango "pango_font_map_load_fontset")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> PangoFontDescriptionRecord.PolyML.PTR
             &&> PangoLanguageRecord.PolyML.PTR
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a PangoFontMapClass.t
    type 'a fontclass_t = 'a PangoFontClass.t
    type 'a fontsetclass_t = 'a PangoFontsetClass.t
    type languagerecord_t = PangoLanguageRecord.t
    type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    type 'a contextclass_t = 'a PangoContextClass.t
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
