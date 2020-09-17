structure PangoRenderer :>
  PANGO_RENDERER
    where type 'a class = 'a PangoRendererClass.class
    where type glyph_t = PangoGlyph.t
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
      val getType_ = call (getSymbol "pango_renderer_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val activate_ = call (getSymbol "pango_renderer_activate") (PangoRendererClass.PolyML.cPtr --> cVoid)
      val deactivate_ = call (getSymbol "pango_renderer_deactivate") (PangoRendererClass.PolyML.cPtr --> cVoid)
      val drawErrorUnderline_ =
        call (getSymbol "pango_renderer_draw_error_underline")
          (
            PangoRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val drawGlyph_ =
        call (getSymbol "pango_renderer_draw_glyph")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyph.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val drawGlyphItem_ =
        call (getSymbol "pango_renderer_draw_glyph_item")
          (
            PangoRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> PangoGlyphItemRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val drawGlyphs_ =
        call (getSymbol "pango_renderer_draw_glyphs")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoGlyphStringRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val drawLayout_ =
        call (getSymbol "pango_renderer_draw_layout")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoLayoutClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val drawLayoutLine_ =
        call (getSymbol "pango_renderer_draw_layout_line")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoLayoutLineRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val drawRectangle_ =
        call (getSymbol "pango_renderer_draw_rectangle")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val drawTrapezoid_ =
        call (getSymbol "pango_renderer_draw_trapezoid")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val getAlpha_ = call (getSymbol "pango_renderer_get_alpha") (PangoRendererClass.PolyML.cPtr &&> PangoRenderPart.PolyML.cVal --> GUInt16.PolyML.cVal)
      val getColor_ = call (getSymbol "pango_renderer_get_color") (PangoRendererClass.PolyML.cPtr &&> PangoRenderPart.PolyML.cVal --> PangoColorRecord.PolyML.cOptPtr)
      val getLayout_ = call (getSymbol "pango_renderer_get_layout") (PangoRendererClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cOptPtr)
      val getLayoutLine_ = call (getSymbol "pango_renderer_get_layout_line") (PangoRendererClass.PolyML.cPtr --> PangoLayoutLineRecord.PolyML.cOptPtr)
      val getMatrix_ = call (getSymbol "pango_renderer_get_matrix") (PangoRendererClass.PolyML.cPtr --> PangoMatrixRecord.PolyML.cOptPtr)
      val partChanged_ = call (getSymbol "pango_renderer_part_changed") (PangoRendererClass.PolyML.cPtr &&> PangoRenderPart.PolyML.cVal --> cVoid)
      val setAlpha_ =
        call (getSymbol "pango_renderer_set_alpha")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> GUInt16.PolyML.cVal
             --> cVoid
          )
      val setColor_ =
        call (getSymbol "pango_renderer_set_color")
          (
            PangoRendererClass.PolyML.cPtr
             &&> PangoRenderPart.PolyML.cVal
             &&> PangoColorRecord.PolyML.cOptPtr
             --> cVoid
          )
      val setMatrix_ = call (getSymbol "pango_renderer_set_matrix") (PangoRendererClass.PolyML.cPtr &&> PangoMatrixRecord.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a PangoRendererClass.class
    type glyph_t = PangoGlyph.t
    type glyph_item_t = PangoGlyphItemRecord.t
    type glyph_string_t = PangoGlyphStringRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type 'a layout_class = 'a PangoLayoutClass.class
    type layout_line_t = PangoLayoutLineRecord.t
    type color_t = PangoColorRecord.t
    type render_part_t = PangoRenderPart.t
    type matrix_t = PangoMatrixRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate self = (PangoRendererClass.FFI.withPtr false ---> I) activate_ self
    fun deactivate self = (PangoRendererClass.FFI.withPtr false ---> I) deactivate_ self
    fun drawErrorUnderline
      self
      (
        x,
        y,
        width,
        height
      ) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun drawGlyph
      self
      (
        font,
        glyph,
        x,
        y
      ) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> PangoFontClass.FFI.withPtr false
         &&&> PangoGlyph.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
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
    fun drawGlyphItem
      self
      (
        text,
        glyphItem,
        x,
        y
      ) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> PangoGlyphItemRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun drawGlyphs
      self
      (
        font,
        glyphs,
        x,
        y
      ) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> PangoFontClass.FFI.withPtr false
         &&&> PangoGlyphStringRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun drawLayout
      self
      (
        layout,
        x,
        y
      ) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> PangoLayoutClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        drawLayout_
        (
          self
           & layout
           & x
           & y
        )
    fun drawLayoutLine
      self
      (
        line,
        x,
        y
      ) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> PangoLayoutLineRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        drawLayoutLine_
        (
          self
           & line
           & x
           & y
        )
    fun drawRectangle
      self
      (
        part,
        x,
        y,
        width,
        height
      ) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> PangoRenderPart.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun drawTrapezoid
      self
      (
        part,
        y1,
        x11,
        x21,
        y2,
        x12,
        x22
      ) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> PangoRenderPart.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
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
    fun getAlpha self part = (PangoRendererClass.FFI.withPtr false &&&> PangoRenderPart.FFI.withVal ---> GUInt16.FFI.fromVal) getAlpha_ (self & part)
    fun getColor self part = (PangoRendererClass.FFI.withPtr false &&&> PangoRenderPart.FFI.withVal ---> PangoColorRecord.FFI.fromOptPtr false) getColor_ (self & part) before PangoRendererClass.FFI.touchPtr self
    fun getLayout self = (PangoRendererClass.FFI.withPtr false ---> PangoLayoutClass.FFI.fromOptPtr false) getLayout_ self before PangoRendererClass.FFI.touchPtr self
    fun getLayoutLine self = (PangoRendererClass.FFI.withPtr false ---> PangoLayoutLineRecord.FFI.fromOptPtr false) getLayoutLine_ self before PangoRendererClass.FFI.touchPtr self
    fun getMatrix self = (PangoRendererClass.FFI.withPtr false ---> PangoMatrixRecord.FFI.fromOptPtr false) getMatrix_ self before PangoRendererClass.FFI.touchPtr self
    fun partChanged self part = (PangoRendererClass.FFI.withPtr false &&&> PangoRenderPart.FFI.withVal ---> I) partChanged_ (self & part)
    fun setAlpha self (part, alpha) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> PangoRenderPart.FFI.withVal
         &&&> GUInt16.FFI.withVal
         ---> I
      )
        setAlpha_
        (
          self
           & part
           & alpha
        )
    fun setColor self (part, color) =
      (
        PangoRendererClass.FFI.withPtr false
         &&&> PangoRenderPart.FFI.withVal
         &&&> PangoColorRecord.FFI.withOptPtr false
         ---> I
      )
        setColor_
        (
          self
           & part
           & color
        )
    fun setMatrix self matrix = (PangoRendererClass.FFI.withPtr false &&&> PangoMatrixRecord.FFI.withOptPtr false ---> I) setMatrix_ (self & matrix)
  end
