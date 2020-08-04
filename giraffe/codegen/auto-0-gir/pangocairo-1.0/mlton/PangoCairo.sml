structure PangoCairo : PANGO_CAIRO =
  struct
    val contextGetFontOptions_ = _import "pango_cairo_context_get_font_options" : PangoContextClass.FFI.non_opt PangoContextClass.FFI.p -> CairoFontOptionsRecord.FFI.opt CairoFontOptionsRecord.FFI.p;
    val contextGetResolution_ = _import "pango_cairo_context_get_resolution" : PangoContextClass.FFI.non_opt PangoContextClass.FFI.p -> GDouble.FFI.val_;
    val contextSetFontOptions_ = fn x1 & x2 => (_import "pango_cairo_context_set_font_options" : PangoContextClass.FFI.non_opt PangoContextClass.FFI.p * CairoFontOptionsRecord.FFI.opt CairoFontOptionsRecord.FFI.p -> unit;) (x1, x2)
    val contextSetResolution_ = fn x1 & x2 => (_import "pango_cairo_context_set_resolution" : PangoContextClass.FFI.non_opt PangoContextClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val createContext_ = _import "pango_cairo_create_context" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> PangoContextClass.FFI.non_opt PangoContextClass.FFI.p;
    val createLayout_ = _import "pango_cairo_create_layout" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> PangoLayoutClass.FFI.non_opt PangoLayoutClass.FFI.p;
    val errorUnderlinePath_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_cairo_error_underline_path" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val glyphStringPath_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_cairo_glyph_string_path" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * PangoFontClass.FFI.non_opt PangoFontClass.FFI.p
               * PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val layoutLinePath_ = fn x1 & x2 => (_import "pango_cairo_layout_line_path" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p * PangoLayoutLineRecord.FFI.non_opt PangoLayoutLineRecord.FFI.p -> unit;) (x1, x2)
    val layoutPath_ = fn x1 & x2 => (_import "pango_cairo_layout_path" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p * PangoLayoutClass.FFI.non_opt PangoLayoutClass.FFI.p -> unit;) (x1, x2)
    val showErrorUnderline_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_cairo_show_error_underline" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val showGlyphItem_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_cairo_show_glyph_item" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * PangoGlyphItemRecord.FFI.non_opt PangoGlyphItemRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val showGlyphString_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_cairo_show_glyph_string" :
              CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               * PangoFontClass.FFI.non_opt PangoFontClass.FFI.p
               * PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val showLayout_ = fn x1 & x2 => (_import "pango_cairo_show_layout" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p * PangoLayoutClass.FFI.non_opt PangoLayoutClass.FFI.p -> unit;) (x1, x2)
    val showLayoutLine_ = fn x1 & x2 => (_import "pango_cairo_show_layout_line" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p * PangoLayoutLineRecord.FFI.non_opt PangoLayoutLineRecord.FFI.p -> unit;) (x1, x2)
    val updateContext_ = fn x1 & x2 => (_import "pango_cairo_update_context" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p * PangoContextClass.FFI.non_opt PangoContextClass.FFI.p -> unit;) (x1, x2)
    val updateLayout_ = fn x1 & x2 => (_import "pango_cairo_update_layout" : CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p * PangoLayoutClass.FFI.non_opt PangoLayoutClass.FFI.p -> unit;) (x1, x2)
    structure FcFontMapClass = PangoCairoFcFontMapClass
    structure FontClass = PangoCairoFontClass
    structure FontMapClass = PangoCairoFontMapClass
    structure FcFontMap = PangoCairoFcFontMap
    structure Font = PangoCairoFont
    structure FontMap = PangoCairoFontMap
    fun contextGetFontOptions context = (PangoContextClass.FFI.withPtr false ---> CairoFontOptionsRecord.FFI.fromOptPtr false) contextGetFontOptions_ context
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
