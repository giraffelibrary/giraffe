structure PangoFontsetSimple :>
  PANGO_FONTSET_SIMPLE
    where type 'a class = 'a PangoFontsetSimpleClass.class
    where type language_t = PangoLanguageRecord.t
    where type 'a font_class = 'a PangoFontClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_fontset_simple_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_fontset_simple_new") (PangoLanguageRecord.PolyML.cPtr --> PangoFontsetSimpleClass.PolyML.cPtr)
      val append_ = call (getSymbol "pango_fontset_simple_append") (PangoFontsetSimpleClass.PolyML.cPtr &&> PangoFontClass.PolyML.cPtr --> cVoid)
      val size_ = call (getSymbol "pango_fontset_simple_size") (PangoFontsetSimpleClass.PolyML.cPtr --> GInt.PolyML.cVal)
    end
    type 'a class = 'a PangoFontsetSimpleClass.class
    type language_t = PangoLanguageRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new language = (PangoLanguageRecord.FFI.withPtr false ---> PangoFontsetSimpleClass.FFI.fromPtr true) new_ language
    fun append self font = (PangoFontsetSimpleClass.FFI.withPtr false &&&> PangoFontClass.FFI.withPtr false ---> I) append_ (self & font)
    fun size self = (PangoFontsetSimpleClass.FFI.withPtr false ---> GInt.FFI.fromVal) size_ self
  end
