structure PangoCairo : PANGO_CAIRO =
  struct
    local
      open PolyMLFFI
    in
      val contextGetFontOptions_ = call (load_sym libpangocairo "pango_cairo_context_get_font_options") (GObjectObjectClass.PolyML.PTR --> CairoFontOptionsRecord.PolyML.PTR)
      val contextGetResolution_ = call (load_sym libpangocairo "pango_cairo_context_get_resolution") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Double.VAL)
      val contextSetFontOptions_ = call (load_sym libpangocairo "pango_cairo_context_set_font_options") (GObjectObjectClass.PolyML.PTR &&> CairoFontOptionsRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val contextSetResolution_ = call (load_sym libpangocairo "pango_cairo_context_set_resolution") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Double.VAL --> FFI.PolyML.VOID)
      val createContext_ = call (load_sym libpangocairo "pango_cairo_create_context") (CairoContextRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val createLayout_ = call (load_sym libpangocairo "pango_cairo_create_layout") (CairoContextRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val errorUnderlinePath_ =
        call (load_sym libpangocairo "pango_cairo_error_underline_path")
          (
            CairoContextRecord.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             --> FFI.PolyML.VOID
          )
      val fontMapGetDefault_ = call (load_sym libpangocairo "pango_cairo_font_map_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val fontMapNew_ = call (load_sym libpangocairo "pango_cairo_font_map_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val glyphStringPath_ =
        call (load_sym libpangocairo "pango_cairo_glyph_string_path")
          (
            CairoContextRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> PangoGlyphStringRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val layoutLinePath_ = call (load_sym libpangocairo "pango_cairo_layout_line_path") (CairoContextRecord.PolyML.PTR &&> PangoLayoutLineRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val layoutPath_ = call (load_sym libpangocairo "pango_cairo_layout_path") (CairoContextRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val showErrorUnderline_ =
        call (load_sym libpangocairo "pango_cairo_show_error_underline")
          (
            CairoContextRecord.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             --> FFI.PolyML.VOID
          )
      val showGlyphItem_ =
        call (load_sym libpangocairo "pango_cairo_show_glyph_item")
          (
            CairoContextRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> PangoGlyphItemRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val showGlyphString_ =
        call (load_sym libpangocairo "pango_cairo_show_glyph_string")
          (
            CairoContextRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> PangoGlyphStringRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val showLayout_ = call (load_sym libpangocairo "pango_cairo_show_layout") (CairoContextRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val showLayoutLine_ = call (load_sym libpangocairo "pango_cairo_show_layout_line") (CairoContextRecord.PolyML.PTR &&> PangoLayoutLineRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val updateContext_ = call (load_sym libpangocairo "pango_cairo_update_context") (CairoContextRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val updateLayout_ = call (load_sym libpangocairo "pango_cairo_update_layout") (CairoContextRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    structure FcFontMapClass = PangoCairoFcFontMapClass
    structure FontClass = PangoCairoFontClass
    structure FontMapClass = PangoCairoFontMapClass
    structure FcFontMap = PangoCairoFcFontMap
    structure Font = PangoCairoFont
    structure FontMap = PangoCairoFontMap
    fun contextGetFontOptions context = (GObjectObjectClass.C.withPtr ---> CairoFontOptionsRecord.C.fromPtr false) contextGetFontOptions_ context
    fun contextGetResolution context = (GObjectObjectClass.C.withPtr ---> FFI.Double.fromVal) contextGetResolution_ context
    fun contextSetFontOptions context options = (GObjectObjectClass.C.withPtr &&&> CairoFontOptionsRecord.C.withPtr ---> I) contextSetFontOptions_ (context & options)
    fun contextSetResolution context dpi = (GObjectObjectClass.C.withPtr &&&> FFI.Double.withVal ---> I) contextSetResolution_ (context & dpi)
    fun createContext cr = (CairoContextRecord.C.withPtr ---> PangoContextClass.C.fromPtr true) createContext_ cr
    fun createLayout cr = (CairoContextRecord.C.withPtr ---> PangoLayoutClass.C.fromPtr true) createLayout_ cr
    fun errorUnderlinePath cr x y width height =
      (
        CairoContextRecord.C.withPtr
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
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
         &&&> GObjectObjectClass.C.withPtr
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
    fun layoutPath cr layout = (CairoContextRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) layoutPath_ (cr & layout)
    fun showErrorUnderline cr x y width height =
      (
        CairoContextRecord.C.withPtr
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
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
         &&&> FFI.String.withConstPtr
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
         &&&> GObjectObjectClass.C.withPtr
         &&&> PangoGlyphStringRecord.C.withPtr
         ---> I
      )
        showGlyphString_
        (
          cr
           & font
           & glyphs
        )
    fun showLayout cr layout = (CairoContextRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) showLayout_ (cr & layout)
    fun showLayoutLine cr line = (CairoContextRecord.C.withPtr &&&> PangoLayoutLineRecord.C.withPtr ---> I) showLayoutLine_ (cr & line)
    fun updateContext cr context = (CairoContextRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) updateContext_ (cr & context)
    fun updateLayout cr layout = (CairoContextRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) updateLayout_ (cr & layout)
  end
