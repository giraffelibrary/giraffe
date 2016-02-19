structure PangoCairo : PANGO_CAIRO =
  struct
    val contextGetFontOptions_ = _import "pango_cairo_context_get_font_options" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> CairoFontOptionsRecord.C.notnull CairoFontOptionsRecord.C.p;
    val contextGetResolution_ = _import "pango_cairo_context_get_resolution" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val contextSetFontOptions_ = fn x1 & x2 => (_import "pango_cairo_context_set_font_options" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * CairoFontOptionsRecord.C.notnull CairoFontOptionsRecord.C.p -> unit;) (x1, x2)
    val contextSetResolution_ = fn x1 & x2 => (_import "pango_cairo_context_set_resolution" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val createContext_ = _import "pango_cairo_create_context" : CairoContextRecord.C.notnull CairoContextRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val createLayout_ = _import "pango_cairo_create_layout" : CairoContextRecord.C.notnull CairoContextRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val errorUnderlinePath_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_cairo_error_underline_path" :
              CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val fontMapGetDefault_ = _import "pango_cairo_font_map_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val fontMapNew_ = _import "pango_cairo_font_map_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val glyphStringPath_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_cairo_glyph_string_path" :
              CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val layoutLinePath_ = fn x1 & x2 => (_import "pango_cairo_layout_line_path" : CairoContextRecord.C.notnull CairoContextRecord.C.p * PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p -> unit;) (x1, x2)
    val layoutPath_ = fn x1 & x2 => (_import "pango_cairo_layout_path" : CairoContextRecord.C.notnull CairoContextRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val showErrorUnderline_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_cairo_show_error_underline" :
              CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
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
              CairoContextRecord.C.notnull CairoContextRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * PangoGlyphItemRecord.C.notnull PangoGlyphItemRecord.C.p
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
              CairoContextRecord.C.notnull CairoContextRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val showLayout_ = fn x1 & x2 => (_import "pango_cairo_show_layout" : CairoContextRecord.C.notnull CairoContextRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val showLayoutLine_ = fn x1 & x2 => (_import "pango_cairo_show_layout_line" : CairoContextRecord.C.notnull CairoContextRecord.C.p * PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p -> unit;) (x1, x2)
    val updateContext_ = fn x1 & x2 => (_import "pango_cairo_update_context" : CairoContextRecord.C.notnull CairoContextRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val updateLayout_ = fn x1 & x2 => (_import "pango_cairo_update_layout" : CairoContextRecord.C.notnull CairoContextRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    structure FcFontMapClass = PangoCairoFcFontMapClass
    structure FontClass = PangoCairoFontClass
    structure FontMapClass = PangoCairoFontMapClass
    structure FcFontMap = PangoCairoFcFontMap
    structure Font = PangoCairoFont
    structure FontMap = PangoCairoFontMap
    fun contextGetFontOptions context = (GObjectObjectClass.C.withPtr ---> CairoFontOptionsRecord.C.fromPtr false) contextGetFontOptions_ context
    fun contextGetResolution context = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) contextGetResolution_ context
    fun contextSetFontOptions context options = (GObjectObjectClass.C.withPtr &&&> CairoFontOptionsRecord.C.withPtr ---> I) contextSetFontOptions_ (context & options)
    fun contextSetResolution context dpi = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) contextSetResolution_ (context & dpi)
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
