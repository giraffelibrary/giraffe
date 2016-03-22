structure PangoCairo : PANGO_CAIRO =
  struct
    local
      open PolyMLFFI
    in
      val contextGetFontOptions_ = call (load_sym libpangocairo "pango_cairo_context_get_font_options") (PangoContextClass.PolyML.cPtr --> CairoFontOptionsRecord.PolyML.cPtr)
      val contextGetResolution_ = call (load_sym libpangocairo "pango_cairo_context_get_resolution") (PangoContextClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val contextSetFontOptions_ = call (load_sym libpangocairo "pango_cairo_context_set_font_options") (PangoContextClass.PolyML.cPtr &&> CairoFontOptionsRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val contextSetResolution_ = call (load_sym libpangocairo "pango_cairo_context_set_resolution") (PangoContextClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val createContext_ = call (load_sym libpangocairo "pango_cairo_create_context") (CairoContextRecord.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val createLayout_ = call (load_sym libpangocairo "pango_cairo_create_layout") (CairoContextRecord.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val errorUnderlinePath_ =
        call (load_sym libpangocairo "pango_cairo_error_underline_path")
          (
            CairoContextRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val fontMapGetDefault_ = call (load_sym libpangocairo "pango_cairo_font_map_get_default") (FFI.PolyML.cVoid --> PangoFontMapClass.PolyML.cPtr)
      val fontMapNew_ = call (load_sym libpangocairo "pango_cairo_font_map_new") (FFI.PolyML.cVoid --> PangoFontMapClass.PolyML.cPtr)
      val glyphStringPath_ =
        call (load_sym libpangocairo "pango_cairo_glyph_string_path")
          (
            CairoContextRecord.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val layoutLinePath_ = call (load_sym libpangocairo "pango_cairo_layout_line_path") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutLineRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val layoutPath_ = call (load_sym libpangocairo "pango_cairo_layout_path") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val showErrorUnderline_ =
        call (load_sym libpangocairo "pango_cairo_show_error_underline")
          (
            CairoContextRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val showGlyphItem_ =
        call (load_sym libpangocairo "pango_cairo_show_glyph_item")
          (
            CairoContextRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> PangoGlyphItemRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val showGlyphString_ =
        call (load_sym libpangocairo "pango_cairo_show_glyph_string")
          (
            CairoContextRecord.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val showLayout_ = call (load_sym libpangocairo "pango_cairo_show_layout") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val showLayoutLine_ = call (load_sym libpangocairo "pango_cairo_show_layout_line") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutLineRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val updateContext_ = call (load_sym libpangocairo "pango_cairo_update_context") (CairoContextRecord.PolyML.cPtr &&> PangoContextClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val updateLayout_ = call (load_sym libpangocairo "pango_cairo_update_layout") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    structure FcFontMapClass = PangoCairoFcFontMapClass
    structure FontClass = PangoCairoFontClass
    structure FontMapClass = PangoCairoFontMapClass
    structure FcFontMap = PangoCairoFcFontMap
    structure Font = PangoCairoFont
    structure FontMap = PangoCairoFontMap
    fun contextGetFontOptions context = (PangoContextClass.C.withPtr ---> CairoFontOptionsRecord.C.fromPtr false) contextGetFontOptions_ context
    fun contextGetResolution context = (PangoContextClass.C.withPtr ---> FFI.Double.C.fromVal) contextGetResolution_ context
    fun contextSetFontOptions context options = (PangoContextClass.C.withPtr &&&> CairoFontOptionsRecord.C.withPtr ---> I) contextSetFontOptions_ (context & options)
    fun contextSetResolution context dpi = (PangoContextClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) contextSetResolution_ (context & dpi)
    fun createContext cr = (CairoContextRecord.C.withPtr ---> PangoContextClass.C.fromPtr true) createContext_ cr
    fun createLayout cr = (CairoContextRecord.C.withPtr ---> PangoLayoutClass.C.fromPtr true) createLayout_ cr
    fun errorUnderlinePath cr x y width height =
      (
        CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        errorUnderlinePath_
        (
          cr
           & x
           & y
           & width
           & height
        )
    fun fontMapGetDefault () = (I ---> PangoFontMapClass.C.fromPtr false) fontMapGetDefault_ ()
    fun fontMapNew () = (I ---> PangoFontMapClass.C.fromPtr true) fontMapNew_ ()
    fun glyphStringPath cr font glyphs =
      (
        CairoContextRecord.C.withPtr
         &&&> PangoFontClass.C.withPtr
         &&&> PangoGlyphStringRecord.C.withPtr
         ---> I
      )
        glyphStringPath_
        (
          cr
           & font
           & glyphs
        )
    fun layoutLinePath cr line = (CairoContextRecord.C.withPtr &&&> PangoLayoutLineRecord.C.withPtr ---> I) layoutLinePath_ (cr & line)
    fun layoutPath cr layout = (CairoContextRecord.C.withPtr &&&> PangoLayoutClass.C.withPtr ---> I) layoutPath_ (cr & layout)
    fun showErrorUnderline cr x y width height =
      (
        CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        showErrorUnderline_
        (
          cr
           & x
           & y
           & width
           & height
        )
    fun showGlyphItem cr text glyphItem =
      (
        CairoContextRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> PangoGlyphItemRecord.C.withPtr
         ---> I
      )
        showGlyphItem_
        (
          cr
           & text
           & glyphItem
        )
    fun showGlyphString cr font glyphs =
      (
        CairoContextRecord.C.withPtr
         &&&> PangoFontClass.C.withPtr
         &&&> PangoGlyphStringRecord.C.withPtr
         ---> I
      )
        showGlyphString_
        (
          cr
           & font
           & glyphs
        )
    fun showLayout cr layout = (CairoContextRecord.C.withPtr &&&> PangoLayoutClass.C.withPtr ---> I) showLayout_ (cr & layout)
    fun showLayoutLine cr line = (CairoContextRecord.C.withPtr &&&> PangoLayoutLineRecord.C.withPtr ---> I) showLayoutLine_ (cr & line)
    fun updateContext cr context = (CairoContextRecord.C.withPtr &&&> PangoContextClass.C.withPtr ---> I) updateContext_ (cr & context)
    fun updateLayout cr layout = (CairoContextRecord.C.withPtr &&&> PangoLayoutClass.C.withPtr ---> I) updateLayout_ (cr & layout)
  end
