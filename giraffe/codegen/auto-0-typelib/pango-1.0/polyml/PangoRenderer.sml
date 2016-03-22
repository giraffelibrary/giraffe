structure PangoRenderer :>
  PANGO_RENDERER
    where type 'a class = 'a PangoRendererClass.class
    where type glyph_item_t = PangoGlyphItemRecord.t
    where type glyph_string_t = PangoGlyphStringRecord.t
    where type 'a font_class = 'a PangoFontClass.class
    where type 'a layout_class = 'a PangoLayoutClass.class
    where type layout_line_t = PangoLayoutLineRecord.t
    where type color_t = PangoColorRecord.t
    where type render_part_t = PangoRenderPart.t
    where type matrix_t = PangoMatrixRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_renderer_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val activate_ = call (load_sym libpango "pango_renderer_activate") (PangoRendererClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val deactivate_ = call (load_sym libpango "pango_renderer_deactivate") (PangoRendererClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val drawErrorUnderline_ =
        call (load_sym libpango "pango_renderer_draw_error_underline")
          (
            PangoRendererClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val drawGlyph_ =
        call (load_sym libpango "pango_renderer_draw_glyph")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val drawGlyphItem_ =
        call (load_sym libpango "pango_renderer_draw_glyph_item")
          (
            PangoRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> PangoGlyphItemRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val drawGlyphs_ =
        call (load_sym libpango "pango_renderer_draw_glyphs")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val drawLayout_ =
        call (load_sym libpango "pango_renderer_draw_layout")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoLayoutClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val drawLayoutLine_ =
        call (load_sym libpango "pango_renderer_draw_layout_line")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoLayoutLineRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val drawRectangle_ =
        call (load_sym libpango "pango_renderer_draw_rectangle")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val drawTrapezoid_ =
        call (load_sym libpango "pango_renderer_draw_trapezoid")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getColor_ = call (load_sym libpango "pango_renderer_get_color") (PangoRendererClass.PolyML.cPtr &&> PangoRenderPart.PolyML.cVal --> PangoColorRecord.PolyML.cPtr)
      val getLayout_ = call (load_sym libpango "pango_renderer_get_layout") (PangoRendererClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutLine_ = call (load_sym libpango "pango_renderer_get_layout_line") (PangoRendererClass.PolyML.cPtr --> PangoLayoutLineRecord.PolyML.cPtr)
      val getMatrix_ = call (load_sym libpango "pango_renderer_get_matrix") (PangoRendererClass.PolyML.cPtr --> PangoMatrixRecord.PolyML.cPtr)
      val partChanged_ = call (load_sym libpango "pango_renderer_part_changed") (PangoRendererClass.PolyML.cPtr &&> PangoRenderPart.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColor_ =
        call (load_sym libpango "pango_renderer_set_color")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> PangoColorRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val setMatrix_ = call (load_sym libpango "pango_renderer_set_matrix") (PangoRendererClass.PolyML.cPtr &&> PangoMatrixRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a PangoRendererClass.class
    type glyph_item_t = PangoGlyphItemRecord.t
    type glyph_string_t = PangoGlyphStringRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type 'a layout_class = 'a PangoLayoutClass.class
    type layout_line_t = PangoLayoutLineRecord.t
    type color_t = PangoColorRecord.t
    type render_part_t = PangoRenderPart.t
    type matrix_t = PangoMatrixRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self = (PangoRendererClass.C.withPtr ---> I) activate_ self
    fun deactivate self = (PangoRendererClass.C.withPtr ---> I) deactivate_ self
    fun drawErrorUnderline self x y width height =
      (
        PangoRendererClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        drawErrorUnderline_
        (
          self
           & x
           & y
           & width
           & height
        )
    fun drawGlyph self font glyph x y =
      (
        PangoRendererClass.C.withPtr
         &&&> PangoFontClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        drawGlyph_
        (
          self
           & font
           & glyph
           & x
           & y
        )
    fun drawGlyphItem self text glyphItem x y =
      (
        PangoRendererClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> PangoGlyphItemRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        drawGlyphItem_
        (
          self
           & text
           & glyphItem
           & x
           & y
        )
    fun drawGlyphs self font glyphs x y =
      (
        PangoRendererClass.C.withPtr
         &&&> PangoFontClass.C.withPtr
         &&&> PangoGlyphStringRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        drawGlyphs_
        (
          self
           & font
           & glyphs
           & x
           & y
        )
    fun drawLayout self layout x y =
      (
        PangoRendererClass.C.withPtr
         &&&> PangoLayoutClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        drawLayout_
        (
          self
           & layout
           & x
           & y
        )
    fun drawLayoutLine self line x y =
      (
        PangoRendererClass.C.withPtr
         &&&> PangoLayoutLineRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        drawLayoutLine_
        (
          self
           & line
           & x
           & y
        )
    fun drawRectangle self part x y width height =
      (
        PangoRendererClass.C.withPtr
         &&&> PangoRenderPart.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        drawRectangle_
        (
          self
           & part
           & x
           & y
           & width
           & height
        )
    fun drawTrapezoid self part y1 x11 x21 y2 x12 x22 =
      (
        PangoRendererClass.C.withPtr
         &&&> PangoRenderPart.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        drawTrapezoid_
        (
          self
           & part
           & y1
           & x11
           & x21
           & y2
           & x12
           & x22
        )
    fun getColor self part = (PangoRendererClass.C.withPtr &&&> PangoRenderPart.C.withVal ---> PangoColorRecord.C.fromPtr true) getColor_ (self & part)
    fun getLayout self = (PangoRendererClass.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutLine self = (PangoRendererClass.C.withPtr ---> PangoLayoutLineRecord.C.fromPtr true) getLayoutLine_ self
    fun getMatrix self = (PangoRendererClass.C.withPtr ---> PangoMatrixRecord.C.fromPtr false) getMatrix_ self
    fun partChanged self part = (PangoRendererClass.C.withPtr &&&> PangoRenderPart.C.withVal ---> I) partChanged_ (self & part)
    fun setColor self part color =
      (
        PangoRendererClass.C.withPtr
         &&&> PangoRenderPart.C.withVal
         &&&> PangoColorRecord.C.withOptPtr
         ---> I
      )
        setColor_
        (
          self
           & part
           & color
        )
    fun setMatrix self matrix = (PangoRendererClass.C.withPtr &&&> PangoMatrixRecord.C.withOptPtr ---> I) setMatrix_ (self & matrix)
  end
