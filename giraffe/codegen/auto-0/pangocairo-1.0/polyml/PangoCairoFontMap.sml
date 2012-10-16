structure PangoCairoFontMap :>
  PANGO_CAIRO_FONT_MAP
    where type 'a class_t = 'a PangoCairoFontMapClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpangocairo "pango_cairo_font_map_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libpangocairo "pango_cairo_font_map_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val new_ = call (load_sym libpangocairo "pango_cairo_font_map_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getResolution_ = call (load_sym libpangocairo "pango_cairo_font_map_get_resolution") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val setDefault_ = call (load_sym libpangocairo "pango_cairo_font_map_set_default") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setResolution_ = call (load_sym libpangocairo "pango_cairo_font_map_set_resolution") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Double.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a PangoCairoFontMapClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> PangoFontMapClass.C.fromPtr false) getDefault_ ()
    fun new () = (I ---> PangoFontMapClass.C.fromPtr true) new_ ()
    fun getResolution self = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) getResolution_ self
    fun setDefault self = (GObjectObjectClass.C.withPtr ---> I) setDefault_ self
    fun setResolution self dpi = (GObjectObjectClass.C.withPtr &&&> FFI.Double.withVal ---> I) setResolution_ (self & dpi)
  end
