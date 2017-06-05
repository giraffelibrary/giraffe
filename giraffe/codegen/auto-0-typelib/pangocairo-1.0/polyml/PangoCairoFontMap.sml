structure PangoCairoFontMap :>
  PANGO_CAIRO_FONT_MAP
    where type 'a class = 'a PangoCairoFontMapClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpangocairo "pango_cairo_font_map_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libpangocairo "pango_cairo_font_map_get_default") (PolyMLFFI.cVoid --> PangoFontMapClass.PolyML.cPtr)
      val new_ = call (load_sym libpangocairo "pango_cairo_font_map_new") (PolyMLFFI.cVoid --> PangoFontMapClass.PolyML.cPtr)
      val getResolution_ = call (load_sym libpangocairo "pango_cairo_font_map_get_resolution") (PangoCairoFontMapClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setDefault_ = call (load_sym libpangocairo "pango_cairo_font_map_set_default") (PangoCairoFontMapClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setResolution_ = call (load_sym libpangocairo "pango_cairo_font_map_set_resolution") (PangoCairoFontMapClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a PangoCairoFontMapClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> PangoFontMapClass.FFI.fromPtr false) getDefault_ ()
    fun new () = (I ---> PangoFontMapClass.FFI.fromPtr true) new_ ()
    fun getResolution self = (PangoCairoFontMapClass.FFI.withPtr ---> GDouble.FFI.fromVal) getResolution_ self
    fun setDefault self = (PangoCairoFontMapClass.FFI.withPtr ---> I) setDefault_ self
    fun setResolution self dpi = (PangoCairoFontMapClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setResolution_ (self & dpi)
  end
