structure PangoFontsetSimple :>
  PANGO_FONTSET_SIMPLE
    where type 'a class = 'a PangoFontsetSimpleClass.class
    where type language_t = PangoLanguageRecord.t
    where type 'a font_class = 'a PangoFontClass.class =
  struct
    val getType_ = _import "pango_fontset_simple_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_fontset_simple_new" : PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p -> PangoFontsetSimpleClass.FFI.notnull PangoFontsetSimpleClass.FFI.p;
    val append_ = fn x1 & x2 => (_import "pango_fontset_simple_append" : PangoFontsetSimpleClass.FFI.notnull PangoFontsetSimpleClass.FFI.p * PangoFontClass.FFI.notnull PangoFontClass.FFI.p -> unit;) (x1, x2)
    val size_ = _import "pango_fontset_simple_size" : PangoFontsetSimpleClass.FFI.notnull PangoFontsetSimpleClass.FFI.p -> GInt32.FFI.val_;
    type 'a class = 'a PangoFontsetSimpleClass.class
    type language_t = PangoLanguageRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new language = (PangoLanguageRecord.FFI.withPtr ---> PangoFontsetSimpleClass.FFI.fromPtr true) new_ language
    fun append self font = (PangoFontsetSimpleClass.FFI.withPtr &&&> PangoFontClass.FFI.withPtr ---> I) append_ (self & font)
    fun size self = (PangoFontsetSimpleClass.FFI.withPtr ---> GInt32.FFI.fromVal) size_ self
  end
