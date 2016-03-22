structure PangoCairoFontMap :>
  PANGO_CAIRO_FONT_MAP
    where type 'a class = 'a PangoCairoFontMapClass.class =
  struct
    val getType_ = _import "pango_cairo_font_map_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "pango_cairo_font_map_get_default" : unit -> PangoFontMapClass.C.notnull PangoFontMapClass.C.p;
    val new_ = _import "pango_cairo_font_map_new" : unit -> PangoFontMapClass.C.notnull PangoFontMapClass.C.p;
    val getResolution_ = _import "pango_cairo_font_map_get_resolution" : PangoCairoFontMapClass.C.notnull PangoCairoFontMapClass.C.p -> FFI.Double.C.val_;
    val setDefault_ = _import "pango_cairo_font_map_set_default" : PangoCairoFontMapClass.C.notnull PangoCairoFontMapClass.C.p -> unit;
    val setResolution_ = fn x1 & x2 => (_import "pango_cairo_font_map_set_resolution" : PangoCairoFontMapClass.C.notnull PangoCairoFontMapClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a PangoCairoFontMapClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> PangoFontMapClass.C.fromPtr false) getDefault_ ()
    fun new () = (I ---> PangoFontMapClass.C.fromPtr true) new_ ()
    fun getResolution self = (PangoCairoFontMapClass.C.withPtr ---> FFI.Double.C.fromVal) getResolution_ self
    fun setDefault self = (PangoCairoFontMapClass.C.withPtr ---> I) setDefault_ self
    fun setResolution self dpi = (PangoCairoFontMapClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setResolution_ (self & dpi)
  end
