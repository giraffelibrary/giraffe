structure PangoFontMap :>
  PANGO_FONT_MAP
    where type 'a class = 'a PangoFontMapClass.class
    where type 'a font_class = 'a PangoFontClass.class
    where type 'a fontset_class = 'a PangoFontsetClass.class
    where type language_t = PangoLanguageRecord.t
    where type font_description_t = PangoFontDescriptionRecord.t
    where type 'a context_class = 'a PangoContextClass.class =
  struct
    val getType_ = _import "pango_font_map_get_type" : unit -> GObjectType.C.val_;
    val createContext_ = _import "pango_font_map_create_context" : PangoFontMapClass.C.notnull PangoFontMapClass.C.p -> PangoContextClass.C.notnull PangoContextClass.C.p;
    val loadFont_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_font_map_load_font" :
              PangoFontMapClass.C.notnull PangoFontMapClass.C.p
               * PangoContextClass.C.notnull PangoContextClass.C.p
               * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               -> PangoFontClass.C.notnull PangoFontClass.C.p;
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
              PangoFontMapClass.C.notnull PangoFontMapClass.C.p
               * PangoContextClass.C.notnull PangoContextClass.C.p
               * PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p
               * PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p
               -> PangoFontsetClass.C.notnull PangoFontsetClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a PangoFontMapClass.class
    type 'a font_class = 'a PangoFontClass.class
    type 'a fontset_class = 'a PangoFontsetClass.class
    type language_t = PangoLanguageRecord.t
    type font_description_t = PangoFontDescriptionRecord.t
    type 'a context_class = 'a PangoContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createContext self = (PangoFontMapClass.C.withPtr ---> PangoContextClass.C.fromPtr true) createContext_ self
    fun loadFont self context desc =
      (
        PangoFontMapClass.C.withPtr
         &&&> PangoContextClass.C.withPtr
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
        PangoFontMapClass.C.withPtr
         &&&> PangoContextClass.C.withPtr
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
