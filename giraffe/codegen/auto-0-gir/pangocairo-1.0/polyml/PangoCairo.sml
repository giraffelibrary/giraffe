structure PangoCairo : PANGO_CAIRO =
  struct
    local
      open PolyMLFFI
    in
      val contextGetFontOptions_ = call (getSymbol "pango_cairo_context_get_font_options") (PangoContextClass.PolyML.cPtr --> CairoFontOptionsRecord.PolyML.cPtr)
      val contextGetResolution_ = call (getSymbol "pango_cairo_context_get_resolution") (PangoContextClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val contextSetFontOptions_ = call (getSymbol "pango_cairo_context_set_font_options") (PangoContextClass.PolyML.cPtr &&> CairoFontOptionsRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val contextSetResolution_ = call (getSymbol "pango_cairo_context_set_resolution") (PangoContextClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> PolyMLFFI.cVoid)
      val createContext_ = call (getSymbol "pango_cairo_create_context") (CairoContextRecord.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val createLayout_ = call (getSymbol "pango_cairo_create_layout") (CairoContextRecord.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val errorUnderlinePath_ =
        call (getSymbol "pango_cairo_error_underline_path")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val fontMapGetDefault_ = call (getSymbol "pango_cairo_font_map_get_default") (PolyMLFFI.cVoid --> PangoFontMapClass.PolyML.cPtr)
      val fontMapNew_ = call (getSymbol "pango_cairo_font_map_new") (PolyMLFFI.cVoid --> PangoFontMapClass.PolyML.cPtr)
      val glyphStringPath_ =
        call (getSymbol "pango_cairo_glyph_string_path")
          (
            CairoContextRecord.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val layoutLinePath_ = call (getSymbol "pango_cairo_layout_line_path") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutLineRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val layoutPath_ = call (getSymbol "pango_cairo_layout_path") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val showErrorUnderline_ =
        call (getSymbol "pango_cairo_show_error_underline")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val showGlyphItem_ =
        call (getSymbol "pango_cairo_show_glyph_item")
          (
            CairoContextRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> PangoGlyphItemRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val showGlyphString_ =
        call (getSymbol "pango_cairo_show_glyph_string")
          (
            CairoContextRecord.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val showLayout_ = call (getSymbol "pango_cairo_show_layout") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val showLayoutLine_ = call (getSymbol "pango_cairo_show_layout_line") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutLineRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val updateContext_ = call (getSymbol "pango_cairo_update_context") (CairoContextRecord.PolyML.cPtr &&> PangoContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val updateLayout_ = call (getSymbol "pango_cairo_update_layout") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    structure FcFontMapClass = PangoCairoFcFontMapClass
    structure FontClass = PangoCairoFontClass
    structure FontMapClass = PangoCairoFontMapClass
    structure FcFontMap = PangoCairoFcFontMap
    structure Font = PangoCairoFont
    structure FontMap = PangoCairoFontMap
    fun contextGetFontOptions context = (PangoContextClass.FFI.withPtr ---> CairoFontOptionsRecord.FFI.fromPtr false) contextGetFontOptions_ context
    fun contextGetResolution context = (PangoContextClass.FFI.withPtr ---> GDouble.FFI.fromVal) contextGetResolution_ context
    fun contextSetFontOptions context options = (PangoContextClass.FFI.withPtr &&&> CairoFontOptionsRecord.FFI.withPtr ---> I) contextSetFontOptions_ (context & options)
    fun contextSetResolution context dpi = (PangoContextClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) contextSetResolution_ (context & dpi)
    fun createContext cr = (CairoContextRecord.FFI.withPtr ---> PangoContextClass.FFI.fromPtr true) createContext_ cr
    fun createLayout cr = (CairoContextRecord.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr true) createLayout_ cr
    fun errorUnderlinePath cr x y width height =
      (
        CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
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
    fun fontMapGetDefault () = (I ---> PangoFontMapClass.FFI.fromPtr false) fontMapGetDefault_ ()
    fun fontMapNew () = (I ---> PangoFontMapClass.FFI.fromPtr true) fontMapNew_ ()
    fun glyphStringPath cr font glyphs =
      (
        CairoContextRecord.FFI.withPtr
         &&&> PangoFontClass.FFI.withPtr
         &&&> PangoGlyphStringRecord.FFI.withPtr
         ---> I
      )
        glyphStringPath_
        (
          cr
           & font
           & glyphs
        )
    fun layoutLinePath cr line = (CairoContextRecord.FFI.withPtr &&&> PangoLayoutLineRecord.FFI.withPtr ---> I) layoutLinePath_ (cr & line)
    fun layoutPath cr layout = (CairoContextRecord.FFI.withPtr &&&> PangoLayoutClass.FFI.withPtr ---> I) layoutPath_ (cr & layout)
    fun showErrorUnderline cr x y width height =
      (
        CairoContextRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
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
        CairoContextRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> PangoGlyphItemRecord.FFI.withPtr
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
        CairoContextRecord.FFI.withPtr
         &&&> PangoFontClass.FFI.withPtr
         &&&> PangoGlyphStringRecord.FFI.withPtr
         ---> I
      )
        showGlyphString_
        (
          cr
           & font
           & glyphs
        )
    fun showLayout cr layout = (CairoContextRecord.FFI.withPtr &&&> PangoLayoutClass.FFI.withPtr ---> I) showLayout_ (cr & layout)
    fun showLayoutLine cr line = (CairoContextRecord.FFI.withPtr &&&> PangoLayoutLineRecord.FFI.withPtr ---> I) showLayoutLine_ (cr & line)
    fun updateContext cr context = (CairoContextRecord.FFI.withPtr &&&> PangoContextClass.FFI.withPtr ---> I) updateContext_ (cr & context)
    fun updateLayout cr layout = (CairoContextRecord.FFI.withPtr &&&> PangoLayoutClass.FFI.withPtr ---> I) updateLayout_ (cr & layout)
  end
