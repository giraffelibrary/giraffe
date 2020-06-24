structure PangoCairoFontMap :>
  PANGO_CAIRO_FONT_MAP
    where type 'a class = 'a PangoCairoFontMapClass.class =
  struct
    val getType_ = _import "pango_cairo_font_map_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "pango_cairo_font_map_get_default" : unit -> PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p;
    val new_ = _import "pango_cairo_font_map_new" : unit -> PangoFontMapClass.FFI.non_opt PangoFontMapClass.FFI.p;
    val getResolution_ = _import "pango_cairo_font_map_get_resolution" : PangoCairoFontMapClass.FFI.non_opt PangoCairoFontMapClass.FFI.p -> GDouble.FFI.val_;
    val setDefault_ = _import "pango_cairo_font_map_set_default" : PangoCairoFontMapClass.FFI.non_opt PangoCairoFontMapClass.FFI.p -> unit;
    val setResolution_ = fn x1 & x2 => (_import "pango_cairo_font_map_set_resolution" : PangoCairoFontMapClass.FFI.non_opt PangoCairoFontMapClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a PangoCairoFontMapClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> PangoFontMapClass.FFI.fromPtr false) getDefault_ ()
    fun new () = (I ---> PangoFontMapClass.FFI.fromPtr true) new_ ()
    fun getResolution self = (PangoCairoFontMapClass.FFI.withPtr ---> GDouble.FFI.fromVal) getResolution_ self
    fun setDefault self = (PangoCairoFontMapClass.FFI.withPtr ---> I) setDefault_ self
    fun setResolution self dpi = (PangoCairoFontMapClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setResolution_ (self & dpi)
  end
