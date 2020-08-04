structure PangoCairoFontMap :>
  PANGO_CAIRO_FONT_MAP
    where type 'a class = 'a PangoCairoFontMapClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_cairo_font_map_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "pango_cairo_font_map_get_default") (cVoid --> PangoFontMapClass.PolyML.cPtr)
      val new_ = call (getSymbol "pango_cairo_font_map_new") (cVoid --> PangoFontMapClass.PolyML.cPtr)
      val getResolution_ = call (getSymbol "pango_cairo_font_map_get_resolution") (PangoCairoFontMapClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setDefault_ = call (getSymbol "pango_cairo_font_map_set_default") (PangoCairoFontMapClass.PolyML.cPtr --> cVoid)
      val setResolution_ = call (getSymbol "pango_cairo_font_map_set_resolution") (PangoCairoFontMapClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a PangoCairoFontMapClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> PangoFontMapClass.FFI.fromPtr false) getDefault_ ()
    fun new () = (I ---> PangoFontMapClass.FFI.fromPtr true) new_ ()
    fun getResolution self = (PangoCairoFontMapClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getResolution_ self
    fun setDefault self = (PangoCairoFontMapClass.FFI.withPtr false ---> I) setDefault_ self
    fun setResolution self dpi = (PangoCairoFontMapClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setResolution_ (self & dpi)
  end
