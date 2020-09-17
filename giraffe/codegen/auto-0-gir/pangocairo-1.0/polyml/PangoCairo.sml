structure PangoCairo : PANGO_CAIRO =
  struct
    local
      open PolyMLFFI
    in
      val contextGetFontOptions_ = call (getSymbol "pango_cairo_context_get_font_options") (PangoContextClass.PolyML.cPtr --> CairoFontOptionsRecord.PolyML.cOptPtr)
      val contextGetResolution_ = call (getSymbol "pango_cairo_context_get_resolution") (PangoContextClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val contextSetFontOptions_ = call (getSymbol "pango_cairo_context_set_font_options") (PangoContextClass.PolyML.cPtr &&> CairoFontOptionsRecord.PolyML.cOptPtr --> cVoid)
      val contextSetResolution_ = call (getSymbol "pango_cairo_context_set_resolution") (PangoContextClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
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
             --> cVoid
          )
      val glyphStringPath_ =
        call (getSymbol "pango_cairo_glyph_string_path")
          (
            CairoContextRecord.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             --> cVoid
          )
      val layoutLinePath_ = call (getSymbol "pango_cairo_layout_line_path") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutLineRecord.PolyML.cPtr --> cVoid)
      val layoutPath_ = call (getSymbol "pango_cairo_layout_path") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> cVoid)
      val showErrorUnderline_ =
        call (getSymbol "pango_cairo_show_error_underline")
          (
            CairoContextRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val showGlyphItem_ =
        call (getSymbol "pango_cairo_show_glyph_item")
          (
            CairoContextRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> PangoGlyphItemRecord.PolyML.cPtr
             --> cVoid
          )
      val showGlyphString_ =
        call (getSymbol "pango_cairo_show_glyph_string")
          (
            CairoContextRecord.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             --> cVoid
          )
      val showLayout_ = call (getSymbol "pango_cairo_show_layout") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> cVoid)
      val showLayoutLine_ = call (getSymbol "pango_cairo_show_layout_line") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutLineRecord.PolyML.cPtr --> cVoid)
      val updateContext_ = call (getSymbol "pango_cairo_update_context") (CairoContextRecord.PolyML.cPtr &&> PangoContextClass.PolyML.cPtr --> cVoid)
      val updateLayout_ = call (getSymbol "pango_cairo_update_layout") (CairoContextRecord.PolyML.cPtr &&> PangoLayoutClass.PolyML.cPtr --> cVoid)
    end
    structure FcFontMapClass = PangoCairoFcFontMapClass
    structure FontClass = PangoCairoFontClass
    structure FontMapClass = PangoCairoFontMapClass
    structure FcFontMap = PangoCairoFcFontMap
    structure Font = PangoCairoFont
    structure FontMap = PangoCairoFontMap
    fun contextGetFontOptions context = (PangoContextClass.FFI.withPtr false ---> CairoFontOptionsRecord.FFI.fromOptPtr false) contextGetFontOptions_ context before PangoContextClass.FFI.touchPtr context
    fun contextGetResolution context = (PangoContextClass.FFI.withPtr false ---> GDouble.FFI.fromVal) contextGetResolution_ context
    fun contextSetFontOptions (context, options) = (PangoContextClass.FFI.withPtr false &&&> CairoFontOptionsRecord.FFI.withOptPtr false ---> I) contextSetFontOptions_ (context & options)
    fun contextSetResolution (context, dpi) = (PangoContextClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) contextSetResolution_ (context & dpi)
    fun createContext cr = (CairoContextRecord.FFI.withPtr false ---> PangoContextClass.FFI.fromPtr true) createContext_ cr
    fun createLayout cr = (CairoContextRecord.FFI.withPtr false ---> PangoLayoutClass.FFI.fromPtr true) createLayout_ cr
    fun errorUnderlinePath
      (
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        CairoContextRecord.FFI.withPtr false
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
    fun glyphStringPath
      (
        cr,
        font,
        glyphs
      ) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> PangoFontClass.FFI.withPtr false
         &&&> PangoGlyphStringRecord.FFI.withPtr false
         ---> I
      )
        glyphStringPath_
        (
          cr
           & font
           & glyphs
        )
    fun layoutLinePath (cr, line) = (CairoContextRecord.FFI.withPtr false &&&> PangoLayoutLineRecord.FFI.withPtr false ---> I) layoutLinePath_ (cr & line)
    fun layoutPath (cr, layout) = (CairoContextRecord.FFI.withPtr false &&&> PangoLayoutClass.FFI.withPtr false ---> I) layoutPath_ (cr & layout)
    fun showErrorUnderline
      (
        cr,
        x,
        y,
        width,
        height
      ) =
      (
        CairoContextRecord.FFI.withPtr false
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
    fun showGlyphItem
      (
        cr,
        text,
        glyphItem
      ) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> PangoGlyphItemRecord.FFI.withPtr false
         ---> I
      )
        showGlyphItem_
        (
          cr
           & text
           & glyphItem
        )
    fun showGlyphString
      (
        cr,
        font,
        glyphs
      ) =
      (
        CairoContextRecord.FFI.withPtr false
         &&&> PangoFontClass.FFI.withPtr false
         &&&> PangoGlyphStringRecord.FFI.withPtr false
         ---> I
      )
        showGlyphString_
        (
          cr
           & font
           & glyphs
        )
    fun showLayout (cr, layout) = (CairoContextRecord.FFI.withPtr false &&&> PangoLayoutClass.FFI.withPtr false ---> I) showLayout_ (cr & layout)
    fun showLayoutLine (cr, line) = (CairoContextRecord.FFI.withPtr false &&&> PangoLayoutLineRecord.FFI.withPtr false ---> I) showLayoutLine_ (cr & line)
    fun updateContext (cr, context) = (CairoContextRecord.FFI.withPtr false &&&> PangoContextClass.FFI.withPtr false ---> I) updateContext_ (cr & context)
    fun updateLayout (cr, layout) = (CairoContextRecord.FFI.withPtr false &&&> PangoLayoutClass.FFI.withPtr false ---> I) updateLayout_ (cr & layout)
  end
