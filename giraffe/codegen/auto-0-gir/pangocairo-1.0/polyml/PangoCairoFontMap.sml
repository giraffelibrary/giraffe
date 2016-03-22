structure PangoCairoFontMap :>
  PANGO_CAIRO_FONT_MAP
    where type 'a class = 'a PangoCairoFontMapClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpangocairo "pango_cairo_font_map_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libpangocairo "pango_cairo_font_map_get_default") (FFI.PolyML.cVoid --> PangoFontMapClass.PolyML.cPtr)
      val new_ = call (load_sym libpangocairo "pango_cairo_font_map_new") (FFI.PolyML.cVoid --> PangoFontMapClass.PolyML.cPtr)
      val getResolution_ = call (load_sym libpangocairo "pango_cairo_font_map_get_resolution") (PangoCairoFontMapClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val setDefault_ = call (load_sym libpangocairo "pango_cairo_font_map_set_default") (PangoCairoFontMapClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setResolution_ = call (load_sym libpangocairo "pango_cairo_font_map_set_resolution") (PangoCairoFontMapClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a PangoCairoFontMapClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> PangoFontMapClass.C.fromPtr false) getDefault_ ()
    fun new () = (I ---> PangoFontMapClass.C.fromPtr true) new_ ()
    fun getResolution self = (PangoCairoFontMapClass.C.withPtr ---> FFI.Double.C.fromVal) getResolution_ self
    fun setDefault self = (PangoCairoFontMapClass.C.withPtr ---> I) setDefault_ self
    fun setResolution self dpi = (PangoCairoFontMapClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setResolution_ (self & dpi)
  end
